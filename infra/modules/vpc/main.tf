resource "aws_vpc" "main" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "private" {
  count                = 2
  vpc_id               = aws_vpc.main.id
  cidr_block           = element(["10.10.1.0/24", "10.10.2.0/24"], count.index)
  availability_zone    = element(["us-east-2a", "us-east-2b"], count.index)

  tags = {
    Name = "dev-private-${count.index}"
  }
}
