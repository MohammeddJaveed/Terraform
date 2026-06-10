provider "aws" {
  region = "us-west-1"
}

variable "ami" {
  description = " value of ami"

}
variable "instance_type" {
  description = " value of instance type"
  type        = map(string)
  default = {
    "dev"  = "t2.micro",
    "prod" = "t2.medium"
  }

}

module "ec2_instance" {
  source        = "./modules/ec2_instance"
  ami           = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "dev")
}
