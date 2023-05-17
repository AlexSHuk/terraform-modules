# instance for private subnet 
resource "aws_instance" "private_instance" {
  count = length(var.private_subnets_id)
  ami           = var.ami_instance_private
  instance_type = var.instance_type
  subnet_id     = element(var.private_subnets_id, count.index)
  key_name      = var.key_name
  vpc_security_group_ids = [var.sg_private_subnet]
  tags = {
    Name = "${var.env}-private Instance-${count.index + 1}"
  }
}