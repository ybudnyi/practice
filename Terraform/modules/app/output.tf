output "app_addr" {
  value =   aws_elastic_beanstalk_environment.production.endpoint_url
}