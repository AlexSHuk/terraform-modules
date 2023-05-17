output "public_subnets_id" {
    value = aws_subnet.public[*].id
}

output "cidr_block_public_subnet" {
    value = var.cidr_block_public_subnet
}
output "nat_gateway" {
    value = aws_nat_gateway.nat[*].id
}