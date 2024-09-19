provider "aws" {
    region = "ap-south-1"
}

variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "avail_zone" {}
variable "env_prefix" {}
variable "my_ip" {}
variable "instance_type" {}
# variable "my_public_key" {}
variable "public_key_location" {}

resource "aws_vpc" "myapp-vpc" {
    cidr_block = var.vpc_cidr_block  
    tags = {
      Name: "${var.env_prefix}-vpc"   // stagging,testing,prod
    }
}

resource "aws_subnet" "myapp-subnet-1"{
    vpc_id = aws_vpc.myapp-vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.avail_zone
    tags = {
      Name: "${var.env_prefix}-subnet-1"
    }
}

// create new route table , instead of default one
resource "aws_internet_gateway" "myapp-igw" {
  vpc_id = aws_vpc.myapp-vpc.id
  tags = {
    Name: "${var.env_prefix}-igw"
  }
}

resource "aws_route_table" "myapp-route-table" {
  vpc_id = aws_vpc.myapp-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-igw.id
  }
  tags = {
    Name: "${var.env_prefix}-rtb"
  }
}

// subnet association with route table (In route table section we can found) (So we can ssh into it)
resource "aws_route_table_association" "a-rtb-subnet" {
  subnet_id = aws_subnet.myapp-subnet-1.id
  route_table_id = aws_route_table.myapp-route-table.id

}





/*
# Use the Main Route Table(default) why ?
#  configure default rtb
# terraform state show aws_vpc.myapp-vpc
resource "aws_default_route_table" "default-rtb" {
  default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-igw.id
  }
  tags = {
    Name: "${var.env_prefix}-main-rtb"
  }
}
*/

// Security Grosup  port(22,8080) open this 
resource "aws_security_group" "myapp-sg" {
  name = "myapp-sg"
  vpc_id = aws_vpc.myapp-vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = [var.my_ip]   //check in
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]   //Anyone can access it 
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"  // for any
    cidr_blocks = ["0.0.0.0/0"]
    prefix_list_ids = []
  }
  tags = {
    Name: "${var.env_prefix}-sg"
  }
}





#  use of default SG

resource "aws_default_security_group" "default-sg" {
  # name = "myapp-sg-default"
  vpc_id = aws_vpc.myapp-vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = [var.my_ip]   //check in
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]   //Anyone can access it 
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"  // for any
    cidr_blocks = ["0.0.0.0/0"]
    prefix_list_ids = []
  }
  tags = {
    Name: "${var.env_prefix}-default-sg"
  }
}


# Amazon Machine Image for EC2
# Set AMI dynamically

data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners = ["amazon"]
  filter {                  // Adding filter define the criteria ami
    name = "name"
    values = ["amzn2-ami-kernel-*-x86_64-gp2"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

output "aws_ami_id" {
  value = data.aws_ami.latest-amazon-linux-image.id 
}

output "ec2_public_ip" {
  value = aws_instance.myapp-server.public_ip
}


# Automated the creation of key-pair here
resource "aws_key_pair" "ssh-key" {
  key_name = "newawsVersion"
  public_key = file(var.public_key_location)
  // public_key = var.my_public_key
  // A key pair must already exist locally on your machine
  // We already generated a key pair for Git repo or DigitalOcean Droplet
}




resource "aws_instance" "myapp-server" {
  ami = data.aws_ami.latest-amazon-linux-image.id
  instance_type = var.instance_type
  
  subnet_id = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids = [aws_default_security_group.default-sg.id]
  availability_zone = var.avail_zone

  associate_public_ip_address = true 
  key_name = aws_key_pair.ssh-key.key_name

# Run entrypoint script to start Docker container
/*
user_data = <<EOF
              #!/bin/bash
              sudo yum update -y && sudo yum install -y docker
              sudo systemctl start docker
              sudo usermod -aG docker ec2-user
              docker run -p 8080:80 nginx 
            EOF
*/

// Extract to shell script
user_data = file("entry-script.sh")

user_data_replace_on_change = true //

  tags = {
    Name = "${var.env_prefix}-server"
  }
}

// vpc id & subnet, sg is optional (It created in default region)
// mv your pem file to ~/.ssh/ folder , change to chmod 400 to pem file


# Run entrypoint script to start Docker container
