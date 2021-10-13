data "aws_availability_zones" "available" {}

locals {
  tag = {
    ita_group = "Lv-613"
  }
}
 resource "aws_vpc" "main" {
    cidr_block =  var.vpc_cidr
    enable_dns_hostnames = true
    tags = local.tag
 }
 resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main.id

    tags = local.tag
 }
resource "aws_eip" "ip" {
   vpc   = true
   tags = local.tag
 }

 resource "aws_nat_gateway" "natgw" {
   allocation_id = aws_eip.ip.id
   subnet_id = aws_subnet.app[0].id
   tags = local.tag
 }

 resource "aws_subnet" "app" {
   count                   = length(var.public_subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block              = element(var.public_subnet_cidr, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = local.tag
}
resource "aws_subnet" "db" {
  count                   = length(var.private_subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.private_subnet_cidr, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false
  tags = local.tag
}

 resource "aws_route_table" "app" {
    vpc_id =  aws_vpc.main.id
         route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
     }
    tags = local.tag
 }

 resource "aws_route_table" "db" {
   vpc_id = aws_vpc.main.id
   route {
   cidr_block = "0.0.0.0/0"
   nat_gateway_id = aws_nat_gateway.natgw.id
   }
    tags = local.tag
 }

 resource "aws_route_table_association" "app" {
  count          = length(aws_subnet.app[*].id)
  route_table_id = aws_route_table.app.id
  subnet_id      = element(aws_subnet.app[*].id, count.index)
}


 resource "aws_route_table_association" "db" {
  count          = length(aws_subnet.db[*].id)
  route_table_id = aws_route_table.db.id
  subnet_id      = element(aws_subnet.db[*].id, count.index)
}

resource "aws_db_subnet_group" "db-subnet" {
  name       = "db location"
  subnet_ids = aws_subnet.db.*.id
}