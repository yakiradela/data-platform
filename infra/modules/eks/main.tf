module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "dev-eks"
  cluster_version = "1.29"

  vpc_id     = aws_vpc.main.id
  subnet_ids = [
    aws_subnet.subnet_data.id,
    aws_subnet.subnet_platform.id
  ]

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

