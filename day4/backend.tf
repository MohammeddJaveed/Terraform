terraform {
  backend "s3" {
    bucket = "javeed-terraform-bucket-7460"
    region = "us-west-1"
    key    = "javeed/terraform.tfstate"
  }
}
