provider "aws" {
  region = "us-east-1"
  profile = "default"
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

resource "aws_instance" "Terraform-test"{
  ami = "ami-005f9685cb30f234b"
  instance_type = "t2.micro"
  security_groups = ["default"]
}
