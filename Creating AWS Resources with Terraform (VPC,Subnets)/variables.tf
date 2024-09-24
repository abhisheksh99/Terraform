# varibale for aws region
variable "aws_region" {
    description = "Aws region"
    type = string
    default = "us-east-1"
  
}

# varibale for aws region
variable "access_key" {
    description = "Aws access key"
    type = string
    
  
}

# varibale for aws region
variable "secret_key" {
    description = "Aws secret key"
    type = string
    
  
}

# varibale for aws vpc cidr block
variable "aws_vpc_cidr_block" {
    description = "AWS  VPC cidr_block"
    type = string
    
}

# varibale for aws subnet cidr block
variable "aws_sub_cidr_block" {
    description = "AWS  Subnet cidr_block"
    type = string
    
}
# varibale for aws subnet cidr block
variable "aws_sub_avail_zone" {
    description = "AWS  Subnet availabilty zone"
    type = string
    
}

# varibale for  default aws subnet cidr block
variable "aws_sub_default_cidr_block" {
    description = "AWS  Subnet cidr_block"
    type = string
    
}
# varibale for  default aws subnet cidr block
variable "aws_sub_default_avail_zone" {
    description = "AWS  Subnet availabilty zone"
    type = string
    
}