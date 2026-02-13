# tflint-ignore: terraform_required_version
# tflint-ignore: terraform_required_providers
#tfsec:ignore:aws-s3-enable-bucket-encryption
resource "aws_s3_bucket" "s3_bucket" {
  #checkov:skip=CKV2_AWS_62 Ignore ensure S3 buckets should have event notifications enabled
  #checkov:skip=CKV_AWS_145 Ignore S3 buckets are encrypted with KMS
  #checkov:skip=CKV_AWS_144 Ignore S3 bucket has cross-region replication enabled
  count         = var.enabled == true ? 1 : 0
  bucket_prefix = var.s3_bucket_name

  tags = merge(
    {
      "Name" = format("%s", var.s3_bucket_name)
    },
    var.additional_tags,
  )

  lifecycle {
    create_before_destroy = true
  }

}

# tflint-ignore: terraform_required_version
# tflint-ignore: terraform_required_providers
resource "aws_s3_bucket_lifecycle_configuration" "s3_bucket_lifecycle_configuration" {
  #checkov:skip=CKV_AWS_300 Ignore ensure S3 lifecycle configuration sets period for aborting failed uploads
  bucket = aws_s3_bucket.s3_bucket[0].id

  rule {
    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
    id     = "expire"
    status = "Enabled"
    filter {
      prefix = "logs/"
    }
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    expiration {
      days = 90
    }
  }
}

# tflint-ignore: terraform_required_version
# tflint-ignore: terraform_required_providers
resource "aws_s3_bucket_public_access_block" "some_bucket_access" {
  bucket = aws_s3_bucket.s3_bucket[0].id

  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
}

# tflint-ignore: terraform_required_version
# tflint-ignore: terraform_required_providers
resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket[0].id

  versioning_configuration {
    status = "Enabled"
  }
}

# tflint-ignore: terraform_required_version
# tflint-ignore: terraform_required_providers
resource "aws_s3_bucket_logging" "s3_bucket_logging" {
  bucket        = aws_s3_bucket.s3_bucket[0].id
  target_bucket = aws_s3_bucket.s3_bucket[0].id
  target_prefix = "log/"
}