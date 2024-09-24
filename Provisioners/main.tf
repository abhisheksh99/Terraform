# Terraform block for specific aws version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# AWS provider configuration
provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

# Resources with AWS

# VPC
resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.aws_cidr_blocks[0].cidr_block
  tags = {
    Name = "${var.aws_cidr_blocks[1].name[0]}-vpc"
  }
}

# SUBNET
resource "aws_subnet" "myapp-subnet-1" {
  vpc_id            = aws_vpc.myapp-vpc.id
  cidr_block        = var.aws_cidr_blocks[1].cidr_block
  availability_zone = var.aws_sub_avail_zone
  tags = {
    Name = "${var.aws_cidr_blocks[1].name[0]}-subnet-1"
  }
}

# Route Table
resource "aws_route_table" "myapp-route-table" {
  vpc_id = aws_vpc.myapp-vpc.id
  route {
    cidr_block = var.aws_route_table_cidr_block
    gateway_id = aws_internet_gateway.myapp-internet-gateway.id
  }
  tags = {
    Name = "${var.env-prefix}-route-table"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "myapp-internet-gateway" {
  vpc_id = aws_vpc.myapp-vpc.id
  tags = {
    Name = "${var.env-prefix}-internet-gateway"
  }
}

# Route table association with subnet
resource "aws_route_table_association" "myapp-route-table-subnet-association" {
  subnet_id      = aws_subnet.myapp-subnet-1.id
  route_table_id = aws_route_table.myapp-route-table.id
}

# Security group (Now to ssh we will enable port 22 and for nginx we will enable port 8080)
resource "aws_security_group" "myapp-security-group" {
  name   = "myapp-security-group"
  vpc_id = aws_vpc.myapp-vpc.id

  # Allow SSH access (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  # Allow HTTP access (port 8080)
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic (egress) to download docker and other resources
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env-prefix}-security-group"
  }
}

# EC2 instance
data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"] # This pattern matches Amazon Linux 2023 AMIs
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "ec2-ssh-key" {
  key_name   = "server-key"
  public_key = var.public_key
}

resource "aws_instance" "myapp-server" {
  ami                    = data.aws_ami.latest-amazon-linux-image.id
  instance_type          = var.ec2_instance_type
  subnet_id              = aws_subnet.myapp-subnet-1.id
  availability_zone      = var.aws_sub_avail_zone
  vpc_security_group_ids = [aws_security_group.myapp-security-group.id]

  associate_public_ip_address = true

  # Corrected from public_key to key_name 
  key_name = aws_key_pair.ec2-ssh-key.key_name

  # user_data = file("entry-script.sh")

# remote-exec provisoner invokes script on a remove server
# inline -list of commands
# script -path
# connection we have to define connection for provisoner to connect to our aws resources in this case out Ec2 instance 

connection {
  type = "ssh"
  host = self.public_ip
  user = "ec2-user"
  private_key = var.private_key
   
}
# file provisoner is used to copy file to a remote server
  provisioner "file" {
    source = "entry-script.sh"
    destination = "/home/ec2-user/entry-script-on-ec2.sh"
    
  }
  provisioner "remote-exec" {
    inline = [
      "mkdir newdir"
      

    ]
    script = file("entry-script-on-ec2.sh")
    
  }
# used to run a commnad on local server not on remote aws resources
  provisioner "local-exec" {
    command = "touch l1.txt"
    
  }

  tags = {
    Name = "${var.env-prefix}-server"
  }
}

# Note if you want to use existing/main route table 
# resource "aws_default_route_table" "main-route-table" {
#   default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id

#   route {
#     cidr_block = var.aws_route_table_cidr_block
#     gateway_id = aws_internet_gateway.myapp-internet-gateway.id
#   }
#   tags ={ 
#     Name:"${var.env-prefix}-main-route-table"
#   } 
# }
