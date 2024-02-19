# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host

## ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_ids" {
    description = "Public instance ID"
    value = module.ec2_public.id #only single instance so provide a single value 
}

output "ec2_bastion_public_ip" {
    description = "Public IP address of EC2 instance"
    value = module.ec2_public.public_ip
}

output "ec2_private_instance_ids" {
    description = "Private IP address' assigned to the instances"
    value = [for ec2private in module.ec2_private: ec2private.id] # for loop to create a list of instance ids
}

output "ec2_private_ip" {
    description = "Private IP address of EC2 instance"
    value = [for ec2private in module.ec2_private: ec2private.private_ip] # ditto
}