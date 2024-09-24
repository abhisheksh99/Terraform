variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "env-prefix" {
  description = "Environment prefix"
  type        = string
}

variable "access_key" {
  description = "AWS access key"
  type        = string
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "aws_cidr_blocks" {
  description = "AWS VPC and subnet CIDR blocks"
  type = list(object({
    cidr_block : string
    name : list(string)
  }))
}

variable "aws_sub_avail_zone" {
  description = "AWS subnet availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "my_ip" {
  description = "IP address for SSH access"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "public_key" {
  description = "Public key for EC2 instance"
  type        = string
}