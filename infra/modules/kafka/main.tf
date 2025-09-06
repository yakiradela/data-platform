variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

resource "aws_security_group" "kafka_sg" {
  name        = "kafka-sg"
  description = "Kafka SG"
  vpc_id      = var.vpc_id
}

resource "aws_msk_cluster" "this" {
  cluster_name           = "dev-msk"
  kafka_version          = "3.7.0"
  number_of_broker_nodes = 2

  broker_node_group_info {
    instance_type  = "kafka.m5.large"
    client_subnets = var.subnet_ids
    security_groups = [aws_security_group.kafka_sg.id]
  }

  tags = {
    Name = "dev-msk"
  }
}
