terraform {
  backend "s3" {
    bucket = "adarsha-s3-demo-123"
    key    = "adarsha/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}