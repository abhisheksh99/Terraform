output "vpc_id" {
  value       = module.network.vpc_id
  description = "The ID of the VPC"
}

output "subnet_id" {
  value       = module.network.subnet_id
  description = "The ID of the subnet"
}

output "security_group_id" {
  value       = module.network.security_group_id
  description = "The ID of the security group"
}

output "ec2_instance_id" {
  value       = module.compute.instance_id
  description = "The ID of the EC2 instance"
}

output "ec2_instance_public_ip" {
  value       = module.compute.public_ip
  description = "The public IP address of the EC2 instance"
}