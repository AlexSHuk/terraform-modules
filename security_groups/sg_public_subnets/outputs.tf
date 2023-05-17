output "sg_public_subnet" {
  value = aws_security_group.bastion.id
}