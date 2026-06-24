# This file shows a complete, working example of using variables in Terraform
# to provision an EC2 instance on AWS.

# -----------------------------------------------------------
# STEP 1: Lock the provider version
# -----------------------------------------------------------
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# -----------------------------------------------------------
# STEP 2: Configure the AWS provider
# -----------------------------------------------------------
provider "aws" {
  region = var.aws_region
}

# -----------------------------------------------------------
# STEP 3: Define Input Variables
# -----------------------------------------------------------

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type (size of the server)"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "Amazon Machine Image ID (the OS image for the EC2 instance)"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 in us-east-1
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "my-terraform-server"
}

# -----------------------------------------------------------
# STEP 4: Define the Resource using variables
# -----------------------------------------------------------

resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

# -----------------------------------------------------------
# STEP 5: Define Output Variables
# -----------------------------------------------------------

output "instance_id" {
  description = "The unique ID of the EC2 instance"
  value       = aws_instance.web_server.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web_server.public_ip
}

output "instance_state" {
  description = "Current state of the instance (running, stopped, etc.)"
  value       = aws_instance.web_server.instance_state
}
