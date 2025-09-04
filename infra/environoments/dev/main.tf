terraform {
  required_version = ">= 1.6.0"
}

provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "../../modules/vpc"
}

module "eks" {
  source = "../../modules/eks"
}

module "rds" {
  source = "../../modules/rds"
}

module "kafka" {
  source = "../../modules/kafka"
}

module "s3" {
  source              = "../../modules/s3"
}

module "redshift" {
  source = "../../modules/redshift"
}
