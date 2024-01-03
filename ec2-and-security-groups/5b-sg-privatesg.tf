# SG for private ec2 instances

module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  
  name = "private-sg"
  description = "Security Group with SSH & HTTP port open for everyone"
  vpc_id = module.vpc.vpc_id # grabbed from the vpc-outputs 

# incoming traffic
  ingress_rules = ["ssh-tcp", "http-80-tcp"] # descriptive outlining of ingress rules (port 22 / port 80)
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block] # only allow ssh / http access if it comes from the same cidr block as the vpc
  # restrict traffic to WITHIN the vpc

# outgoing traffic
  egress_rules = ["all-all"] # open to all
  tags = local.common_tags # will be configured with local tags
}
