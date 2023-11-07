# Terraform Block (begins with '{')

terraform {
  required_version = "~> 1.6" # Allows versions that are 1.6.* but not 2.*
  required_providers {
    aws = { # Terraform argument begins with '='
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  profile = "default" # If default profile, don't need this part
  region = "us-east-1"
}

resource "aws_instance" "ec2demo" { # Block types can have 1-2 labels 1) resource type 2) resource name
  ami = "ami-..."
  instance_type = "t2.micro"
  user_data = file("${path.module}/whatever.sh")
  tags = {
    "Name" = "EC2 Demo"
  }
}

## VALIDATION 

variable "instance_type" {
  type = string
  default = t2.micro
  validation {
    condition = default == t2.micro
    error_message = "sorry, we only accept t2.micros"
  }
}