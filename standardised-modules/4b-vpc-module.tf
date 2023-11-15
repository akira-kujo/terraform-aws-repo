module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "5.1.2"

    # calling from both vpc-variables and local-values
    # variables follow naming conventions
    name = "${local.name}-${var.vpc_name}"
    cidr = var.vpc_cidr_block
    azs = var.vpc_availability_zones
    public_subnets = var.vpc_public_subnets
    private_subnets = var.vpc_private_subnets

    # Database Subnet
    database_subnets = var.vpc_database_subnets
    create_database_subnet_group = var.vpc_create_database_subnet_group
    create_database_subnet_route_table = var.vpc_create_database_route_table

    # Nat Gateway
    enable_nat_gateway = var.vpc_enable_nat_gateway
    single_nat_gateway = var.vpc_single_nat_gateway

    enable_dns_hostnames = true # enable ec2 instances to have dns names
    enable_dns_support = true # allows ec2s to communicate with other ec2s with dns names

    tags = local.common_tags
    vpc_tags = local.common_tags

  # Additional Tags to Subnets
    public_subnet_tags = {
    Type = "Public Subnets"
  }
    private_subnet_tags = {
    Type = "Private Subnets"
  }  
    database_subnet_tags = {
    Type = "Private Database Subnets"
  }
}
