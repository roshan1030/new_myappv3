provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  key_name      = "nodeappnew"

  tags = {
    Name = "node-app-new"
  }

  user_data = <<-EOF
              #!/bin/bash
              # Install Docker
              sudo apt-get update
              sudo apt-get install -y docker.io

              # Install npm
              sudo apt-get install -y npm
              EOF
}

resource "aws_security_group" "allow_ssh_new" {
  name        = "allow-ssh_new"
  description = "Allow SSH access from all IPs"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

