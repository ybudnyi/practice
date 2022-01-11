resource "aws_db_instance" "dashvis_db" {
  db_subnet_group_name = var.db_subnet_group_name
  allocated_storage    = 50
  max_allocated_storage = 100
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.name
  username             = var.username
  password             = var.password
  skip_final_snapshot  = true
  copy_tags_to_snapshot = true
  delete_automated_backups = false
  deletion_protection = true
  publicly_accessible = false
  vpc_security_group_ids = [var.sec_group]
  tags = {
    ita_group = "Lv-6130"
  }
}
