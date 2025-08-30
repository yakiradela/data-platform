resource "aws_db_subnet_group" "this" {
  name       = "dev-rds-subnets"
  subnet_ids = module.vpc.private_subnets 
}
  tags = {
    Name = "dev-rds-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  identifier              = "dev-rds"
  engine                  = "postgres"
  engine_version          = "15"
  instance_class          = "db.t3.medium"
  allocated_storage       = 50
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = ["sg-0123456789abcdef0"] # שנה לערך אמיתי
  username                = "etl"
  password                = "chance-me"
  skip_final_snapshot     = true
  publicly_accessible     = false
  deletion_protection     = false
  backup_retention_period = 7

  tags = {
    Name = "dev-rds"
  }
}
