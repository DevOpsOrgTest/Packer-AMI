variable "count" {
  default = 2
}

provider "aws" {
	access_key = "${var.AWS_ACCESS_KEY}"
    secret_key = "${var.AWS_SECRET_KEY}"
  region     = "eu-west-1"
}

resource "aws_instance" "terraformec2" {
  ami = "ami-0a2a32f81e526e7ed"
  instance_type = "t2.micro"
  count="${var.count}"
  security_groups = [
    "access-https"
  ]
}

resource "aws_security_group" "access-https" {
  name = "access-https"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
