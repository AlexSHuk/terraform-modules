variable "db_subnet_group_name" {
    type = string
}
variable "security_group_rds" {
    type = string
}
variable "db_username" {
    description = "Enter name for DataBase user"
    default = "admin"
}
variable "db_password" {
    description = "Enter a password for dataBase user"
    default = "49912311"
}
variable "instance_class_for_db" {
    description = "Enter a instance class for DataBase"
    default = "db.t3.micro"
}
variable "env" {
  type = string
}