# Outputs
output "dev-vpc-id" {
    value = aws_vpc.development-vpc.id
}

output "dev-sub-id" {
    value = aws_subnet.dev-subnet-1.id
}

output "dev-sub-availability-zone" {
    value = aws_subnet.dev-subnet-1.availability_zone
}

output "default-sub-id" {
    value = aws_subnet.default-vpc-subnet-1.id
}

output "default-sub-availability-zone" {
    value = aws_subnet.default-vpc-subnet-1.availability_zone
}