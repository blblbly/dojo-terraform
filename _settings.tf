terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 4.0.0"
    }
  }
}

# Configure the AWS Provider

provider "aws" {
  region  = "eu-west-3"
  default_tags {
    tags = {
        ManagedByTF = "true"
        User = "<blblbly>"
    }
  }
}

# Configure the route 53
data "aws_route53_zone" "selected" {
  name = "dojo.padok.school"
}

# Configure the load balancer
resource "aws_lb" "lb" {
  name = "padok-dojo-lb"
  
}