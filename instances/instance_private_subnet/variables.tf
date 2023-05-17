variable "cidr_block_private_subnet" {
    type = list(string)
}
variable "private_subnets_id" {
    type = list(string)
}
variable "sg_private_subnet" {
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