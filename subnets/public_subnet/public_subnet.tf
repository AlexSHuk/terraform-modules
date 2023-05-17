data "aws_availability_zones" "availables" {}
#creation public subnet
resource "aws_subnet" "public" {
  count = length(var.cidr_block_public_subnet)
  vpc_id     = var.vpc_id
  cidr_block = element(var.cidr_block_public_subnet, count.index)
  availability_zone = data.aws_availability_zones.availables.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env}-public-${count.index + 1}"
  }
}
# creation routing for public subnet
resource "aws_route_table" "public" {
  count = length(var.cidr_block_public_subnet)
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.env}-public-${count.index +1}"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw
  }
}
resource "aws_route_table_association" "public_route_table_association" {
  count = length(aws_subnet.public[*].id)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public[count.index].id
}
#################---NAT---####################

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