module "ec2_private" {
  depends_on = [module.vpc] # vpc + nat gw must be created before private ec2 for internet access or user data will fail
  
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"
  
  # each.key is a special use case for the for_each variable
  for_each = toset(["0", "1"])
  
  # create 2 instances
  name = "private-instance-${each.key}"

  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  monitoring             = true
  vpc_security_group_ids = [module.private_sg.security_group_vpc_id]
  user_data = file("${path.module}/app1.sh")
  tags = local.common_tags
  # create 2 instances with 2 different subnet ids

  subnet_id = element(module.vpc.private_subnets, tonumber(each.key)) # convert for_each string no's to ints
}

  
# meta-argument depends on 