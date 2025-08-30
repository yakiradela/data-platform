module "eks_cluster" {
    source                  = "terraform-aws-modules/eks/aws"
    cluster_name            = "${var.env}-eks"
    cluster_version         = "1.29"
    vpc_id                  = var.vpc_id
    subnet_ids              = var.private_subnets 

    manage_node_groups = {
        default = {
            instance_types  = ["m5.large"]
            min_size        = 2
            max_size        = 5
        }
    }
}
