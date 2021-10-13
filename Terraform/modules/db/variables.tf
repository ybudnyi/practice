variable "engine" {
  default =  "postgres"
  }
variable "engine_version" {
  default =  "12.5"
  }
variable "name" {
  default =  "dashvis"
  }
variable "username" {
  default =  "postgres"
  }
variable "password" {
  default =  "11111111"
  }
variable "sec_group" {
}
variable "instance_class" {
  default = "db.t2.micro"
}
variable "db_subnet_group_name" {
  
}