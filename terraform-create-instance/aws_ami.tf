data "aws_ami" "amzlinux2" {
  executable_users = ["self"]
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.2.*x86_64"] # taken from the AMI public images name layout
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
    filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}