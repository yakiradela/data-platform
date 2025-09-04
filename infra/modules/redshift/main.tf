resource "aws_redshift_subnet_group" "default" {
  name        = "dev-redshift-subnet-group"
  description = "Subnet group for Redshift cluster"
  subnet_ids  = ["subnet-data","subnet-platform"]

  tags = {
    Environment = "dev"
    Name        = "dev-redshift-subnet-group"
  }
}

resource "aws_redshift_cluster" "main" {
  cluster_identifier         = "dev-redshift"
  node_type                  = "dc2.large"
  master_username            = "adminuser"
  master_password            = "yakiradela1234!"
  database_name              = "dataplatform"
  cluster_type               = "single-node"
  port                       = 5439
  publicly_accessible        = false
  skip_final_snapshot        = true
  cluster_subnet_group_name  = "subnet-data"

  tags = {
    Environment = "dev"
    Name        = "dev-redshift"
  }
}
