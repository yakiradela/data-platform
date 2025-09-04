resource "aws_msk_cluster" "this" {
    cluster_name            = "msk-cluster"
    kafka_version           = "3.7.0"
    number_of_broker_nodes  = 2

    broker_node_group_info {
      instance_type         = "kafka.m5.large"
      client_subnets        = "subnet-data"
      security_groups       = "sg-data-platform
    }
}
