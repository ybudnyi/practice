terraform {
  backend "s3" {
    bucket = "demo3-dashvis-state"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}