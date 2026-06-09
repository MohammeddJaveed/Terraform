provider "aws" {
  region = "us-west-1"
}
resource "aws_instance" "example" {
  ami           = "ami-0e564a15089b1ff77"
  instance_type = "t2.micro"
  subnet_id     = "subnet-04a7e449b3498e8f9"
  key_name      = "Terraform"
}
