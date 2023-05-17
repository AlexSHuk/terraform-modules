variable "cidr_block_private_subnet" {
  type = list(string)
  default = ["10.0.11.0/24"]
}
variable "cidr_block_public_subnet" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}
variable "env" {
  type = string
}
variable "nat_gateway" {
  type = list(string)
}