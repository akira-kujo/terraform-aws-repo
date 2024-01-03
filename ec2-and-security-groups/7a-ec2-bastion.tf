module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"
  
  name = "single-instance"

  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  monitoring             = true
  vpc_security_group_ids = module.public_bastion_sg_group_vpc_id
  subnet_id              = module.vpc.public_subnets

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}