variable "count" {
  default = 5
}
provider "aws" {
  access_key = "XXXX"
  secret_key = "XXXX"
  region     = "eu-west-1"
}

resource "aws_instance" "terraformec2" 
{
  ami           = "ami-0a2a32f81e526e7ed"
  instance_type = "t2.micro"
  count="${var.count}"
}
