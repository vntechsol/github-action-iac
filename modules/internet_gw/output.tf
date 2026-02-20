output "internet_gw_id" {
  value = aws_internet_gateway.gw[0].id
}

output "internet_gw_arn" {
  value = aws_internet_gateway.gw[0].arn
}