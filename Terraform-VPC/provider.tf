terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.32.1"
    }
  }
  backend "s3" {
    bucket = "terraform-remote-bucket-s3"
    key = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
    region = "ap-south-1"
}