provider "aws" {
  region = "ap-south-1"
}



# variable "subnet_cidr_block" {
#   description = "subnet cider block"
#   default = "10.0.10.0/24"
#   type = string      //Type Constraints
# }



# variable "cidr_blocks" {
#   description = "cider block subnet and vpc"
#   # default = "10.0.10.0/24"
#   type = list(string)      //Type Constraints
# }



variable "cidr_blocks" {
  description = "cider block subnet and vpc"
  # default = "10.0.10.0/24"
  type = list(object({
    cidr_block = string
    name = string
  }))      //Type Object
}


variable "vpc_cidr_block" {
  description = "vpc cidr block"
}


variable "environment" {
  description = "deployment enviroment"
}



// HardCoded Now access & secrete to connect to our aws account. 
// provider is code that know how to talk to with aws. For this providers needs to be installed to available locally. 
// Or open file providers.tf 
// Through an API providers talk to a AWS. 


// custom global variable
variable avail_zone {}

resource "aws_vpc" "development_vpc" {
  # cidr_block = "10.0.0.0/16"
  # cidr_block = var.vpc_cidr_block    // Get the input from variable file
  # cidr_block = var.cidr_block[0]
  cidr_block = var.cidr_blocks[0].cidr_block 
  tags = {
    # Name: "development"
    # Name :var.environment
    Name: var.cidr_blocks[0].name 
    vpc_env:"dev"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development_vpc.id    // reference the vpc id we created
  # cidr_block = "10.0.10.0/24"   
  # cidr_block = var.subnet_cidr_block    // Get the input from variable file
  # cidr_block = var.cidr_blocks[1]
  cidr_block = var.cidr_blocks[1].cidr_block 
  availability_zone = "ap-south-1a"    // if not given, it will take random one
  tags = {
    # Name: "subnet-1-dev"
    Name : var.cidr_block[1].name
  }
}
// terraform apply 
// resources will create alon with onemore file add 'terraform.tfstate' which track the terrform and aws. 

data "aws_vpc" "existing_vpc" {
  default = true
}
resource "aws_subnet" "dev-subnet-2" {     // Creating subnet in existing vpc
  vpc_id = data.aws_vpc.existing_vpc.id
  cidr_block = "172.31.48.0/20"           // Each subnet inside a VPC has to have a different set of IP addresses!
  # availability_zone = "ap-south-1a"
  availability_zone = var.avail_zone
  tags = {
    Name: "subnet-2-default"
  }
}


// This gives the output values
output "dev-vpc-id" {
  value = aws_vpc.development_vpc.id
}
output "dev-subnet-id" {
  value = aws_subnet.dev-subnet-1.id
}