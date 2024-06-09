terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

# With the help of ChatGPT
resource "aws_security_group" "mc_security_group" {
  name        = "mc_security_group"
  description = "Security group for Minecraft server"
  
  ingress {
    description = "Minecraft"
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh for ansible"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MinecraftSecurityGroup"
  }
}

resource "aws_instance" "mc_server" {
  ami           = "ami-06068bc7800ac1a83"
  instance_type = "t3.small"
  key_name      = "mc_kp"
  security_groups = [aws_security_group.mc_security_group.name]

  tags = {
    Name = "MinecraftServer2"
  }
}

# Allocate an Elastic IP (from ChatGPT)
resource "aws_eip" "mc_eip" {
  vpc = true
}

# Associate the Elastic IP with the EC2 instance
resource "aws_eip_association" "mc_eip_assoc" {
  instance_id   = aws_instance.mc_server.id
  allocation_id = aws_eip.mc_eip.id
}



