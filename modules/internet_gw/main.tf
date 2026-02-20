# tflint-ignore: terraform_required_version
# tflint-ignore: terraform_required_providers
resource "aws_internet_gateway" "gw" {
  count  = var.enabled == true ? 1 : 0
  vpc_id = var.vpc_id

  tags = merge(
    {
      "Name" = format("%s", var.internet_gw_name)
    },
    var.additional_tags,
  )
}