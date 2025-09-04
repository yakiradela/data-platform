resource "aws_vpc" "main" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-data-platform"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "vpc-data-platform-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "vpc-data-platform-public-rt"
  }
}

resource "aws_subnet" "subnet_data" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-data"
  }
}

resource "aws_subnet" "subnet_platform" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.10.2.0/24"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-platform"
  }
}

resource "aws_route_table_association" "subnet_data_assoc" {
  subnet_id      = aws_subnet.subnet_data.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "subnet_platform_assoc" {
  subnet_id      = aws_subnet.subnet_platform.id
  route_table_id = aws_route_table.public.id
}
