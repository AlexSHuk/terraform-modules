#output ID of VPC
output "vpc_id" {
  value = aws_vpc.main.id
}
#output ENV
output "env" {
  value = "dev"
}
#output Internet Gateway
output "igw" {
  value = aws_internet_gateway.gw.id
}