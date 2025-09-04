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

  node_security_group_additional_rules = {
    allow_all_vpc_ingress = {
      description = "Allow all traffic within VPC"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      cidr_blocks = ["10.10.0.0/16"]
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
