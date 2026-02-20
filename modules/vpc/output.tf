output "vpc_id" {
  value = aws_vpc.vpc[0].id
}

output "vpc_arn" {
  value = aws_vpc.vpc[0].arn
}


output "vpc_cidr_block" {
  value = aws_vpc.vpc[0].cidr_block
}

output "vpc_main_route_table_id" {
  value = aws_vpc.vpc[0].main_route_table_id
}

output "vpc_owner_id" {
  value = aws_vpc.vpc[0].owner_id
}