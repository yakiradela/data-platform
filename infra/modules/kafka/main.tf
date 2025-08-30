resource "aws_msk_cluster" "this" {
    cluster_name            = "${var.env}-msk"
    kafka_version           = "3.7.0"
    number_of_broker_nodes  = 2

    broker_node_group_info {
      instance_type         = "kafka.m5.large"
      client_subnets        = var.private_subnets
      security_groups       = [var.sg_id]
    }
}
