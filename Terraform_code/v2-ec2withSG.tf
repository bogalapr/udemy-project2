
provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "demo_server" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"
    key_name = "Devops_project2"
    vpc_security_group_ids = [aws_security_group.sgdemo.id]
  
}

resource "aws_security_group" "sgdemo" {
  name        = "sgdemo"
  description = "to allow SSH Access"
  
  ingress {
    description      = "ssh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh-access"

  }
}
















  
