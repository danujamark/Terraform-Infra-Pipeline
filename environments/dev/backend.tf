terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.67.0"
    }
  }
  backend "S3" {
    bucket = "danuja-teraformbuget"
    key = "environments/dev/terraform.tfstate"
    region = "eu-north-1"
    dynamodb_table = "teraform-lock"
  }
  
}

provider "aws" {
  region = var.aws_region
}