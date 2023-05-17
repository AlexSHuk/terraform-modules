
variable "env" {
    default = "dev"
}
variable "vpc_cidr_block" {
    description = "Enter a sidr block for vpc"
    default = "10.0.0.0/16"
}