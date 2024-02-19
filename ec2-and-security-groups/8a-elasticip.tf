resource "aws_eip" "bastion_eip" { # EIP may require IGW to be created first
  depends_on = [ module.ec2_public, module.vpc ] # until ec2_public and vpc (and igw) are created, dont create this
  instance = module.ec2_public.id # associate with the single public instance
  domain   = "vpc"
  tags = local.common_tags
}
