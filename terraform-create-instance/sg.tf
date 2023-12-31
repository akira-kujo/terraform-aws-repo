resource "aws_security_group" "vpc-ssh" {
  name        = "vpc-ssh"
  description = "dev vpc ssh"

  ingress {
    description      = "Allow ssh communication"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # anywhere ipv4
  }

  egress {
    description = "Allow all ip and ports outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  description = "dev vpc web"

  ingress {
    description      = "Allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # anywhere ipv4
  }

  egress {
    description = "Allow all https"
    from_port        = 443
    to_port          = 443
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}