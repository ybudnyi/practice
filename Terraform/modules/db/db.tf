resource "aws_db_instance" "dashvis_db" {
  db_subnet_group_name = var.db_subnet_group_name
  allocated_storage    = 5
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.name
  username             = var.username
  password             = var.password
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.sec_group]
  tags = {
    ita_group = "Lv-6130"
  }
}
