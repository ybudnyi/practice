provider "aws" {
  region     = var.region
  access_key = var.acces_key
  secret_key = var.secretkey
}
resource "aws_s3_bucket" "tf_state" {
  bucket = "demo3-dashvis-state"

  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    ita_group = "Lv-613"
  }
}
module "vpc" {
  source = ".\\modules\\vpc"
  public_subnet_cidr = [
    "10.0.1.0/24"
  ]
  private_subnet_cidr = [
    "10.0.2.0/24", "10.0.3.0/24"
  ]
}
module "sec_group" {
  source = ".\\modules\\security"
  vpc_id = module.vpc.vpc_id
}
module "db" {
  source               = ".\\modules\\db"
  db_subnet_group_name = module.vpc.db_subnet_group
  sec_group            = module.sec_group.sec_group
}
module "app" {
  source  = ".\\modules\\app"
  vpc_id  = module.vpc.vpc_id
  subnet  = module.vpc.subnet_app
  rdshost = module.db.rds_endpoint
}