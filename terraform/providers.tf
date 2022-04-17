terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    region = "us-east-1"

    bucket         = "logyball-terraform"
    dynamodb_table = "logyball-terraform-locks"

    // key passed in dynamically from backends/*.conf
  }
}

provider "aws" {
  region = "us-east-1"
}