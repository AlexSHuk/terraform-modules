variable "vpc_id" {
  type = string
}
variable "env" {
  type = string
}
variable "cidr_block_database_1_subnet" {
    default = "10.0.21.0/24"
}
variable "cidr_block_database_2_subnet" {
    default = "10.0.22.0/24"
}
variable "availability_zone" {
    description = "Enter Availability zone"
    default = "eu-central-1a"
}
variable "availability_zone_for_db2" {
    description = "Enter Availability zone for dataBase subnet 2"
    default = "eu-central-1b"
}