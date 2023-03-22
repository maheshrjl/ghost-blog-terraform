resource "aws_vpc" "ghost_vpc" {
  cidr_block           = var.environment == "dev" ? var.dev_vpc_cidr : var.prod_vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "ghost-vpc-${var.environment}"
  }
}

resource "aws_subnet" "ghost_subnet" {
  vpc_id            = aws_vpc.ghost_vpc.id
  cidr_block        = var.environment == "dev" ? var.dev_vpc_cidr : var.prod_vpc_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = "ghost-subnet-${var.environment}"
  }
}

resource "aws_internet_gateway" "ghost_igw" {
  vpc_id = aws_vpc.ghost_vpc.id
  tags = {
    Name = "ghost-igw-${var.environment}"
  }
}


resource "aws_route_table" "ghost_route_table" {
  vpc_id = aws_vpc.ghost_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ghost_igw.id
  }
  tags = {
    Name = "ghost-route-table-${var.environment}"
  }
}

resource "aws_route_table_association" "ghost_route_table_association" {
  subnet_id      = aws_subnet.ghost_subnet.id
  route_table_id = aws_route_table.ghost_route_table.id
}
