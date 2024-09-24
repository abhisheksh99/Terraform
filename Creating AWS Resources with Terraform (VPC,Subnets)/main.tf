# Terraform block for specific aws version
terraform {
  
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

# AWS provider configuration

provider "aws" {
  region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
  
}

# Resouces with AWS

#VPC
resource "aws_vpc" "development-vpc" {
  cidr_block = var.aws_vpc_cidr_block
  tags = {
    Name: "development-vpc"
    vpc-env: "dev"
  }
}

#SUBNET
resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = var.aws_sub_cidr_block
  availability_zone = var.aws_sub_avail_zone
  tags = {
    Name: "dev-subnet-1"
  }
  
}

# CREATING A SUBNET IN EXISTING VPC DEFAULT AWS 
data "aws_vpc" "default_vpc"{
  default = true
}

resource "aws_subnet" "default-vpc-subnet-1" {
  vpc_id = data.aws_vpc.default_vpc.id
  cidr_block = var.aws_sub_default_cidr_block
  availability_zone = var.aws_sub_default_avail_zone
  tags = {
    Name: "default-vpc-subnet-1"
  }
  
}