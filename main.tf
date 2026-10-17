provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0b6d9d3d33ba97d99"
  instance_type          = "c7i-flex.large"
  key_name               = "jenkinsproject1"
  vpc_security_group_ids = ["sg-046fd95cf8d098b19"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins20", "tomcat-121", "APPSERVER-12083", "Monitoring server690"]
}

resource "aws_s3_bucket" "gani" {
  bucket = "my-project-artifact-52310"
  versioning {
    enabled = true
  }
}
