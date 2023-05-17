resource "aws_instance" "bastion" {
  count = length(var.cidr_block_public_subnet)
  ami           = var.ami_bastion_host
  instance_type = var.instance_type
  subnet_id     = element(var.public_subnets_id, count.index)
  vpc_security_group_ids = [var.sg_public_subnet]
  key_name      = var.key_name
  associate_public_ip_address = true
  tags = {
    Name = "${var.env}-bastion-${count.index + 1}"
  }
 provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get -y install mysql-client"
    ]
  }
    connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

}