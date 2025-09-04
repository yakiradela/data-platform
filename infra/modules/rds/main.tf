resource "aws_redshift_subnet_group" "default" {
  name        = "dev-redshift-subnet-group"
  description = "Subnet group for Redshift cluster"
  subnet_ids  = [
    aws_subnet.subnet_data.id,
    aws_subnet.subnet_platform.id
  ]

  tags = {
    Environment = "dev"
    Name        = "dev-redshift-subnet-group"
  }
}

resource "aws_redshift_cluster" "main" {
  cluster_identifier         = "dev-redshift"
  node_type                  = "ra3.xlplus"
  master_username            = "adminuser"
  master_password            = "StrongPass123!"
  database_name              = "dataplatform"
  cluster_type               = "single-node"
  port                       = 5439
  publicly_accessible        = false
  skip_final_snapshot        = true
  cluster_subnet_group_name  = aws_redshift_subnet_group.default.name

  tags = {
    Environment = "dev"
    Name        = "dev-redshift"
  }
}
