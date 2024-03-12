provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-07d9b9ddc6cd8dd30" 
  instance_type_value = "t2.micro"
  
}