# AWS EC2 SG 

# Public Bastion Host SG Outputs

output "public_bastion_sg_group_id" {
    description = "ID of the security group"
    value = module.public_bastion_sg_group_id
}

output "public_bastion_sg_group_vpc_id" {
    description = "VPC ID of the security group"
    value = module.public_bastion_sg_group_vpc_id
}

output "public_bastion_sg_group_name" {
    description = "SG name"
    value = module.public_bastion_sg_group_name
}

# Private SG Outputs
output "private_sg_group_id" {
    description = "ID of the security group"
    value = module.private_sg_group_id
}

output "private_sg_group_vpc_id" {
    description = "VPC ID of the security group"
    value = module.private_sg_group_vpc_id
}

output "private_sg_group_name" {
    description = "SG name"
    value = module.private_sg_group_name
}