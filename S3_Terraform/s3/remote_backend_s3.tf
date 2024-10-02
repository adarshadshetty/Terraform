terraform {
  backend "s3" {
    bucket = "aws-devopstofullstack-project1"  //ceate this bucket manually in mentioned region
    key    = "ec2-setup/terraform.tfstate"
    region = "eu-central-1"
  }
}