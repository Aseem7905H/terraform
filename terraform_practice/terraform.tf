terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "tf-ankit-state-bucket"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "tf-ankit-state-dynamo-table"
    
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Create a VPC
