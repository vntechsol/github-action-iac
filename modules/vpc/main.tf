# tflint-ignore: terraform_required_version
# tflint-ignore: terraform_required_providers
resource "aws_vpc" "vpc" {
  #checkov:skip=CKV2_AWS_11 flow log is not needed.
  #checkov:skip=CKV2_AWS_12 default security-group is not needed.
  count                = var.enabled == true ? 1 : 0
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    {
      "Name" = format("%s", var.vpc_name)
    },
    var.additional_tags,
  )

  lifecycle {
    create_before_destroy = true
  }
}