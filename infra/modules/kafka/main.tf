resource "aws_msk_cluster" "this" {
  cluster_name           = "dev-msk"
  kafka_version          = "3.7.1"
  number_of_broker_nodes = 2

  broker_node_group_info {
    instance_type   = "kafka.m5.large"
    client_subnets  = [
      aws_subnet.subnet_data.id,
      aws_subnet.subnet_platform.id
    ]
    security_groups = [aws_security_group.kafka_sg.id]
  }

  tags = {
    Name = "dev-msk"
  }
}

resource "aws_security_group" "kafka_sg" {
  name        = "kafka-sg"
  description = "Kafka SG"
  vpc_id      = aws_vpc.main.id
}
