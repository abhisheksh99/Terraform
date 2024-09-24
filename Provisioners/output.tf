# outputs.tf

output "vpc_id" {
  value       = aws_vpc.myapp-vpc.id
  description = "The ID of the VPC"
}

output "vpc_cidr_block" {
  value       = aws_vpc.myapp-vpc.cidr_block
  description = "The CIDR block of the VPC"
}

output "subnet_id" {
  value       = aws_subnet.myapp-subnet-1.id
  description = "The ID of the subnet"
}

output "subnet_cidr_block" {
  value       = aws_subnet.myapp-subnet-1.cidr_block
  description = "The CIDR block of the subnet"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.myapp-internet-gateway.id
  description = "The ID of the Internet Gateway"
}

output "security_group_id" {
  value       = aws_security_group.myapp-security-group.id
  description = "The ID of the security group"
}

output "ec2_instance_id" {
  value       = aws_instance.myapp-server.id
  description = "The ID of the EC2 instance"
}

output "ec2_instance_public_ip" {
  value       = aws_instance.myapp-server.public_ip
  description = "The public IP address of the EC2 instance"
}

output "ec2_instance_private_ip" {
  value       = aws_instance.myapp-server.private_ip
  description = "The private IP address of the EC2 instance"
}

output "ami_id" {
  value       = data.aws_ami.latest-amazon-linux-image.id
  description = "The ID of the AMI used for the EC2 instance"
}

