# SG for public bastion host

module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  
  name = "public-bastion-sg"
  description = "Security Group with SSH port open for everyone"
  vpc_id = module.vpc.vpc_id # grabbed from the vpc-outputs 

# incoming traffic
  ingress_rules = ["ssh-tcp"] # descriptive outlining of ingress rules (port 22)
  ingress_cidr_blocks = ["0.0.0.0/0"] # any device or user can connect using ssh (port 22)

# outgoing traffic
  egress_rules = ["all-all"] # open to all
  tags = local.common_tags # will be configured with local tags
}
