variable "env" {
  type = string
}
variable "cidr_block_public_subnet" {
  type = list(string)
}
variable "public" {
  type = list(string)
}
