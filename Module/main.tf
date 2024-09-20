provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "myapp-vpc" {
    cidr_block = var.vpc_cidr_block  
    tags = {
      Name: "${var.env_prefix}-vpc"  
    }
}

module "myapp-subnet"{
  source = "./modules/subnet"     // path to the subnet module
  subnet_cidr_block = var.subnet_cidr_block   //referencing varible
  avail_zone = var.avail_zone
  env_prefix = var.env_prefix
  vpc_id = aws_vpc.myapp-vpc.id
  default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id

}

module "myapp-server" {
  source = "./modules/webserver"
  vpc_id = aws_vpc.myapp-vpc.id
  my_ip = var.my_ip
  env_prefix = var.env_prefix
  image_name = var.image_name
  public_key_location = var.public_key_location
  private_key_location = var.private_key_location
  instance_type =var.instance_type
  subnet_id = module.myapp-subnet.subnet.id
  avail_zone = var.avail_zone
}

# resource "aws_route_table_association" "a-rtb-subnet" {
#   subnet_id = module.myapp-subnet.subnet_id      
#   route_table_id = module.myapp-subnet.route_table_id 

# }
# resource "aws_security_group" "myapp-sg" {
#   name = "myapp-sg"
#   vpc_id = aws_vpc.myapp-vpc.id

#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "TCP"
#     cidr_blocks = [var.my_ip]   
#   }
#   ingress {
#     from_port = 8080
#     to_port = 8080
#     protocol = "TCP"
#     cidr_blocks = ["0.0.0.0/0"]  
#   }
#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"  // for any
#     cidr_blocks = ["0.0.0.0/0"]
#     prefix_list_ids = []
#   }
#   tags = {
#     Name: "${var.env_prefix}-sg"
#   }
# }

