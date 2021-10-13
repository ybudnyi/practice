variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = [
    "10.0.10.0/24"
  ]
}

variable "private_subnet_cidr" {
  default = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}
