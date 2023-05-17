# creation NAT 
resource "aws_eip" "nat" {
  count = length(var.cidr_block_public_subnet)
  vpc = true
  tags = {
    Name = "${var.env}-nat-${count.index +1}"
  }
}
resource "aws_nat_gateway" "nat" {
  count = length(var.cidr_block_public_subnet) 
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = element(aws_subnet.public[*].id, count.index)
  tags = {
    Name = "${var.env}-nat-${count.index +1}"
  }
}