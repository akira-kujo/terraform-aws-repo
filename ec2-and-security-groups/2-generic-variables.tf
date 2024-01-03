# variables are called in by the local-values.tf and versions.tf

variable "aws_region" {
    description = "Region in which AWS resources are to be created"
    type = string
    default = "us-east-1"
}

variable "environment"{
    description = "Environment variable used as a prefix"
    type = string
    default = "dev"
}

variable "business_division" {
    description = "business divison in the org this infrastructure belongs to"
    type = string
    default = "SAP"
}
