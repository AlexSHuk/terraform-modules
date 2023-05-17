data "aws_availability_zones" "availables" {}
# private subnet 
resource "aws_subnet" "private" {
  count = length(var.cidr_block_private_subnet)
  vpc_id     = var.vpc_id
  cidr_block = element(var.cidr_block_private_subnet, count.index)
  availability_zone = data.aws_availability_zones.availables.names[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.env}-private-${count.index + 1}"
  }
}
# creation routing for private subnet
resource "aws_route_table" "private" {
  count = length(var.cidr_block_private_subnet)
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.env}-private"
  }
}
resource "aws_route_table_association" "private" {
  count = length(aws_subnet.private[*].id)
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.private[count.index].id
}
resource "aws_route" "private_nat_gateway" {
  count = length(var.cidr_block_public_subnet)
  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(var.nat_gateway, count.index)
}
# associative private subnet with route table
resource "aws_route_table_association" "public_subnet_association" {
  count = length(aws_subnet.private[*].id)
  subnet_id = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.private[count.index].id
}