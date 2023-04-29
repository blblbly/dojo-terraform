terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
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