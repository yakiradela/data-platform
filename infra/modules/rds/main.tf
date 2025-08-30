resource "aws_subnet_group" "this" {
    name                    = "${var.env}-rds-subnets"
    subnet_ids              = var.private_subnets
}

resource "aws_db_instance" "this" {
    identifier              = "${var.env}-rds"
    engine                  = "postgres"
    engine_version          = "15"
    instance_class          = "db.t3.medium"
    allocated_storage       = 50
    db_subnet_group_name    = aws_db_subnet_group.this.name 
    vpc_security_group_ids  = [var.sg_id]
    username                = "etl"
    password                = "chance-me"
    skip_final_snapshot     = true 
    publicly_accessible     = false
    deletion_protection     = false
    backup_retention_period = 7

    tags = {
        Name                = "${var.env}-rds"
    }
}
