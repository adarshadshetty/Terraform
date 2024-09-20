provider "aws" {
  region = "eu-central-1"
}
variable vpc_cidr_blocK {}
variable private_subnets_cidr_blocks {}
variable public_subnets_cidr_blocks {}

data "aws_availability_zones" "azs" {}


module "myapp-vpc" {   #
  source  = "terraform-aws-modules/vpc/aws"  #     * this is from module terraform brose
  version = "5.13.0"   #

  name = "myapp-vpc"
  cidr = var.vpc_cidr_blocK
  private_subnets = var.private_subnets_cidr_blocks
  public_subnets = var.public_subnets_cidr_blocks

  # azs = ["eu-centra-1a","eu-centra-1b","eu-centra-1c"]
  # Set AZ's dynamically depending on the region
  azs = data.aws_availability_zones.azs.names

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/myapp-eks-cluster" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/myapp-eks-cluster" = "shared"
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
     "kubernetes.io/role/internal-elb" = 1
  }

}

# Module code gets downloaded on "terraform init"
# default = one NAT gateway per subnet "enable_nat_gateway = true
# All private subnets will route their internet traffic through this single NAT gateway "single_nat_gateway = true"
# Tags also referencing components from other components (promatically) e.g. for cloud controller manager 


