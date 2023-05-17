# creation DataBase subnet 
resource "aws_subnet" "database1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block_database_1_subnet
  availability_zone = var.availability_zone
  tags = {
    Name = "${var.env}-database1"
  }
}
resource "aws_subnet" "database2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block_database_2_subnet
  availability_zone = var.availability_zone_for_db2
  tags = {
    Name = "${var.env}-database2"
  }
}
resource "aws_db_subnet_group" "database" {
  name = "${var.env}-database-group"
  subnet_ids = [aws_subnet.database1.id,aws_subnet.database2.id]
  tags = {
    Name = "${var.env}-database-group"
  }
}
# creation route table for database subnet
resource "aws_route_table" "database" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.env}-database"
  }
}
resource "aws_route_table_association" "database1" {
  subnet_id      = aws_subnet.database1.id
  route_table_id = aws_route_table.database.id
}
resource "aws_route_table_association" "database2" {
  subnet_id      = aws_subnet.database2.id
  route_table_id = aws_route_table.database.id
}