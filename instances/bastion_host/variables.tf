variable "cidr_block_public_subnet" {
  type    = list(string)
}
variable "public_subnets_id" {
  type    = list(string)
}
variable "sg_public_subnet" {
    type = string
}
variable "key_name" {
    type = string
}
variable "env" {
  type = string
}
variable "ami_bastion_host" {
    default = "ami-081d42a282b78e6d3"
}
variable "ami_instance_private" {
    default = "ami-081d42a282b78e6d3"
}

variable "instance_type" {
    description = "Enter Instance type"
    default = "t2.micro"
}