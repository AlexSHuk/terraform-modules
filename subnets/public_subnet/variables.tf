variable "cidr_block_public_subnet" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}
variable "vpc_id" {
  type = string
}
variable "env" {
  type = string
}
variable "igw" {
  type = string
}
