# security group for rds
resource "aws_security_group" "rds" {
  name = "${var.env}-rds_sg"
  vpc_id = var.vpc_id

  ingress {
    from_port = 0
    to_port = 3306
    protocol = "tcp"
    security_groups = [var.sg_public_subnet]
  }
}