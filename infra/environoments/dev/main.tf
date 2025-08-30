terraform {
  required_version = ">= 1.6.0"
}

provider "aws" {
  region = us-east-2
}

module "vpc" {
  source               = "../../modules/vpc"
  cidr_block           = "10.10.0.0/16"
  env                  = "dev"
  private_subnet_cidrs = ["10.10.1.0/24", "10.10.2.0/24"]
  azs                  = ["us-east-2a", "us-east-2b"]
}

module "eks" {
  source          = "../../modules/eks"
  env             = "dev"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "rds" {
  source          = "../../modules/rds"
  env             = "dev"
  private_subnets = module.vpc.private_subnets
  sg_id           = module.vpc.db_sg_id
  username        = "etl"
  password        = "chance-me"
}

module "kafka" {
  source          = "../../modules/kafka"
  env             = "dev"
  private_subnets = module.vpc.private_subnets
  sg_id           = module.vpc.app_sg_id
}


module "s3" {
  source = "../../modules/s3"
  bucket_name = "dev-data-platform-bucket"
  force_destroy = true
  versioning_enabled = true
}


module "redshift" {
  source                     = "../../modules/redshift"
  env                        = "dev"
  subnet_ids                 = module.vpc.private_subnets
  master_username            = "adminuser"
  master_password            = "yakiradela@A"
  redshift_database_name     = "dataplatform"
}
