# security group for instance in private subnet 
resource "aws_security_group" "private_instance_sg" {
  name = "private_instance_sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    security_groups = [var.sg_public_subnet]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks     = ["0.0.0.0/0"]
  }
}