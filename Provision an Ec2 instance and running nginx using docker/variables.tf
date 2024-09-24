# varibale for aws region
variable "aws_region" {
    description = "Aws region"
    type = string
    default = "us-east-1"
  
}
variable "env-prefix" {
    description = "Enviornmnet prefix"
    type =string
  
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
variable "aws_cidr_blocks" {
    description = "AWS  VPC cidr_block and subnet cidr block"
    type = list(object({
        cidr_block:string
        name:list(string)
    }))
    
}

# varibale for aws availablity zone
variable "aws_sub_avail_zone" {
    description = "Aws subnet availabilty zone"
    type = string
    default = "us-east-1a"
    
  
}

# varibale for Aws cidr block for aws route table
variable "aws_route_table_cidr_block" {
    description = "Aws cidr block for aws route table"
    type = string
    default = "0.0.0.0/0"
    
  
}

# varibale for IP address
variable "my_ip" {
    description = "Ip address"
    type = string
    
  
}

# varibale for ec2 instance type
variable "ec2_instance_type" {
    description = "ec2 instance type"
    type = string
    
  
}

# varibale for public_key
variable "public_key" {
    description = "public_key"
    type = string
    
  
}