provider "aws" {
  region = "us-west-1"

}

resource "aws_instance" "javeed_instance" {
  ami           = "ami-0e564a15089b1ff77"
  instance_type = "t2.micro"
  subnet_id     = "subnet-04a7e449b3498e8f9"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }
}
