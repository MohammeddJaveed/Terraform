
provider "aws" {
  region = "us-west-1"

}
variable "ami" {
  description = " value of ami"

}
variable "instance_type" {
  description = " value of instance type"

}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
}
