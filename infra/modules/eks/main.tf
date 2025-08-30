module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "dev-eks"
  cluster_version = "1.29"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    instance_types = ["m5.large"]
  }

  eks_managed_node_groups = {
    default = {
      min_size     = 2
      max_size     = 3
      desired_size = 2
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
