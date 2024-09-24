module "network" {
  source             = "./network"
  vpc_cidr_block     = var.aws_cidr_blocks[0].cidr_block
  subnet_cidr_block  = var.aws_cidr_blocks[1].cidr_block
  availability_zone  = var.aws_sub_avail_zone
  env_prefix         = var.env-prefix
  my_ip              = var.my_ip
}

module "compute" {
  source            = "./compute"
  instance_type     = var.ec2_instance_type
  subnet_id         = module.network.subnet_id
  security_group_id = module.network.security_group_id
  env_prefix        = var.env-prefix
  public_key        = var.public_key
}
