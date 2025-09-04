resource "aws_vpc" "main" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-data-platform"
  }
}

resource "aws_subnet" "subnet_data" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "subnet-data"
  }
}

resource "aws_subnet" "subnet_platform" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.2.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "subnet-platform"
  }
}
