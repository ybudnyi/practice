output "rds_endpoint" {
  value = aws_db_instance.dashvis_db.address
}
