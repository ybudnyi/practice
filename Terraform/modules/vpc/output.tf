output "vpc_id" {
  value = aws_vpc.main.id
}

output "db_subnet_group" {
    value = aws_db_subnet_group.db-subnet.name
  
}
output "subnet_app" {
  value = aws_subnet.app[0].id
}