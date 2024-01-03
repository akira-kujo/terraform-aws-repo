output "vpc_id" { // output displays the values / info of a terraform infrastructure after creation
    description = "The ID of the VPC" // displays the output of the vpc id thats made
    value = module.vpc.vpc_id // name of the module (module.vpc)
}

output "vpc_cidr_block" {
    description = "The CIDR block of the VPC"
    value = module.vpc.vpc_cidr_block
}

output "vpc_public_subnets" {
    description = "public subnet ID of VPC"
    value = module.vpc.public_subnets
}

output "vpc_private_subnets" {
    description = "private subnet ID of VPC"
    value = module.vpc.private_subnets
}