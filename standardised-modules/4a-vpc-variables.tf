variable "vpc_name" {
    description = "VPC Name"
    type = string
    default = "myvpc"
}

variable "vpc_cidr_block"{
    description = "VPC Cidr Block"
    type = string
    default = "10.0.0.0/16"
}

variable "vpc_availability_zones"{
    description = "VPC availability zone"
    type = list(string)
    default = ["us-east1a","us-east-1b"]
}

variable "vpc_public_subnets"{
    description = "VPC Public Subnets"
    type = list(string)
    default = ["10.0.101.0/24","10.0.102.0/24"]
}

variable "vpc_private_subnets"{
    description = "VPC Private Subnets"
    type = list(string)
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "vpc_database_subnets"{
    description = "VPC Database Subnets"
    type = list(string)
    default = ["10.0.151.0/24","10.0.152.0/24"]
}

variable "vpc_create_database_subnet_group"{
    description = "VPC Database Subnet Group"
    type = bool
    default = true
}

variable "vpc_create_database_route_table"{
    description = "VPC Database Route Table"
    type = bool
    default = true
}

variable "vpc_enable_nat_gateway"{
    description = "VPC enable private subnets for outbound communication"
    type = bool
    default = true
}

variable "vpc_single_nat_gateway" {
  description = "Enable only single NAT Gateway in one Availability Zone to save costs during our demos"
  type = bool
  default = true
}