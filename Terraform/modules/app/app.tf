resource "aws_elastic_beanstalk_application" "dashvis" {
  name        = "dashvis"
  description = "demo3-app"
  tags = {
  ita_group = "Lv-613"
  }
}

resource "aws_elastic_beanstalk_environment" "production" {
  name                = "production"
  application         = aws_elastic_beanstalk_application.dashvis.name
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.12.10 running Ruby 2.4 (Puma)"
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = var.subnet
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_HOSTNAME"
    value = var.rdshost
  }
setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "IamInstanceProfile"
      value = "aws-elasticbeanstalk-ec2-role"
    }
    setting {
      namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "t2.micro"
    }
      setting  {
      namespace = "aws:elasticbeanstalk:application:environment"
    name = "PORT"
    value = "3000"
    }
      setting  {
        namespace = "aws:elasticbeanstalk:application:environment"
    name = "RAILS_SERVE_STATIC_FILES"
    value = "true"
        }
      setting  {
     namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_USERNAME"
    value = "postgres"
        }
      setting  {
     namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_DB_NAME"
    value = "dashvis"
    }
    setting {
     namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_PASSWORD"
    value = var.rds_passwd
    }

    setting {
     namespace = "aws:elasticbeanstalk:application:environment"
    name = "RAILS_ENV"
    value = "production"
    }
    setting {
     namespace = "aws:elasticbeanstalk:application:environment"
    name = "SECRET_KEY_BASE"
    value = "bb87d94301d5653e011d281e01bab94f2b35808ed42b92654ad95c88da33a9c21a3267abc125d69ed3768ffb73992873b1058870b7f036467ffcb8060f13ff20"
    }
    setting {
     namespace = "aws:elasticbeanstalk:application:environment"
    name = "OMNIAUTH_CLIENT_GOOGLE"
    value = "586017836604-ivqenr04o0uu3oijlt2h3edphdeus6j3.apps.googleusercontent.com"
    }
    setting {
     namespace = "aws:elasticbeanstalk:application:environment"
    name = "OMNIAUTH_SECRET_GOOGLE"
    value = "KuMlVxS0U0M8Rpw8YqCoxcyr"
    }

  tags = {
  ita_group = "Lv-613"
  }
}
  
