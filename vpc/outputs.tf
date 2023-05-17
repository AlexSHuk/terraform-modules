#output ID of VPC
output "vpc_id" {
  value = aws_vpc.main.id
}
output "env" {
  value = "dev"
}
output "igw" {
  value = aws_internet_gateway.gw.id
}