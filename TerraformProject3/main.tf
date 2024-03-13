provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "Adarsha" {
    instance_type = "t2.micro"
    ami = "ami-07d9b9ddc6cd8dd30"
}
resource "aws_s3_bucket" "s3_bucket" {
    bucket = "adarsha-s3-demo-123"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name             = "terraform-lock"
  hash_key         = "LocklID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LocklID"
    type = "S"
  }
}
