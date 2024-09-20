module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.24.1"
  cluster_name = "myapp-eks-cluster"
  cluster_version = "1.30"
  cluster_endpoint_public_access  = true

  subnet_ids = module.myapp-vpc.private_subnets
  vpc_id = module.myapp-vpc.vpc_id 

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    dev = {
      min_size     = 1
      max_size     = 3
      desired_size = 3

      instance_types = ["t2.small"]
      
    }
  }

  tags = {
    environment = "development"
    application = "myapp"
  }
}