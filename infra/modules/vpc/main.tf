resource "aws_vpc" "main" {
    cidr_block            = var.cidr_block
    enable_dns_support    = true 
    enable_dns_hostnames  = true 

    tags = {
      Name                = "${var.env}-vpc"
    }
}

resource "aws_subnet" "private" {
    count                 = length(var.private_subnet_cidrs)
    vpc_id                = aws_vpc.main.id 
    cidr_block            = element(var.private_subnet_cidrs, count.index)
    availability_zone     = element(var.azs, count.index)

    tags = {
      Name                = "${var.env}-private-${count.index}"
    }
}
