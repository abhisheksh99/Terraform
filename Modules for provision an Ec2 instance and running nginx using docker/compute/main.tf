data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
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
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  associate_public_ip_address = true
  key_name                    = aws_key_pair.ec2-ssh-key.key_name

  user_data = file("${path.module}/entry-script.sh")

  tags = {
    Name = "${var.env_prefix}-server"
  }
}