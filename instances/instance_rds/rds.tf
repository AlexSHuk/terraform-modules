# creation RDS 
resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = var.instance_class_for_db
  db_name              = "MyDataBase"
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [var.security_group_rds]
  skip_final_snapshot = true
}