# NOTE: Create a terraform.tfvars file with these values

# value of AWS region
aws_region = " Your aws region"
# value of env-prefix
env-prefix = "Your env"
# value of AWS access_key
access_key = "Your aws access_key"
# value of AWS secret_key
secret_key = " Your aws secret_key"

# Resources

# value of AWS VPC-subnet cidr_block
aws_cidr_blocks=[
    {
        cidr_block="Vpc cidr block" , name:"vpc name"
    },
    {
        cidr_block="subnet cidr block" , name:"subnet name"
    }

]

# value of Aws subnet availabilty zone 
aws_sub_avail_zone="Your avail zone"

# varibale for Aws cidr block for aws route table
aws_route_table_cidr_block="0.0.0.0/0"  (#NOTE: defaul keep this if you want to connect to internet as this allows access from anywhere)

# varibale for my ip address
my_ip="ypur ip address "

# varibale for ec2 instance type
ec2_instance_type = "t2.micro"  // t2.micro for free tier account 



