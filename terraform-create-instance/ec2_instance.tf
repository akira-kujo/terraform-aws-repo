# Input Variables
# AWS Region

variable "aws_region" {
  description = "region where AWS resources are created"
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "ec2-instance-type"
  type = string
  default = "t2.micro"
}

resource "aws_key_pair" "deployer" {
  key_name   = "Akira_US_KP"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChlNClD1g2Dp/Z/9gP1TeSY+aUQRQe4vRbs7WbDmgb0JRZ+Iw7hNkM252mDKhzigjTQP1unUAOyUh36K16/FsL/EVmGsxnLki5BRqyIljWQJfkckbVxRlwf0KfgSi7EUnyEQ93giBow0wBG+kvTCypEW5fAH7IlNAwqKM1YeuOXs10eN/qJ77N5vPsWxock2RKAaDKsugey/P7MdinpAhs0AZOyo/tJ9q0iN8axa27klYnVrkqQv0bPKb+0i6YcbUiGAa1OS74RFY0DJ9Wat/kPZONovH1nenCtEJgkBq0HYSoZv4Vka4yQh+zvJsiDEaiD8xK2M9sLJiN+gaObPa3 Akira_US_KP"
}


