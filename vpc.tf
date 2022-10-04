# Prod-rock VPC
resource "aws_vpc" "Prod-rock-VPC" {
  cidr_block       = var.cidr-for-vpc 
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "Prod-rock-VPC"
  }
}

# Public SUbnet 1
 resource "aws_subnet" "test-public-sub1" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.cidr-for-public-sub1
  availability_zone         = var.Pulic-sub1-availability-zone

  tags = {
    Name = "test-public-sub1"
  }
}

# Public SUbnet 2
 resource "aws_subnet" "test-public-sub2" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.cidr-for-public-sub2
  availability_zone         = var.Pulic-sub2-availability-zone

  tags = {
    Name = "test-public-sub2"
  }
}

# Private Subnet 1
 resource "aws_subnet" "test-priv-sub1" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.cidr-for-private-sub1
  availability_zone         = var.Private-sub1-availability-zone

  tags = {
    Name = "test-priv-sub1"
  }
}

# Private Subnet 2
 resource "aws_subnet" "test-priv-sub2" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.cidr-for-private-sub2
  availability_zone         = var.Private-sub2-availability-zone

  tags = {
    Name = "test-priv-sub2"
  }
}

# Public Route Table 
resource "aws_route_table" "Test-pub-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id


  tags = {
    Name = "Test-pub-route-table"
  }
}

# Private Route Table 
resource "aws_route_table" "Test-priv-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id


  tags = {
    Name = "Test-priv-route-table"
  }
}

# Public Route Association 1
resource "aws_route_table_association" "Test-pub-route-table-association-1" {
  subnet_id      = aws_subnet.test-public-sub1.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}

# Public Route Association 2
resource "aws_route_table_association" "Test-pub-route-table-association-2" {
  subnet_id      = aws_subnet.test-public-sub2.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}

# Private Route Association 1
resource "aws_route_table_association" "Test-priv-route-table-association-1" {
  subnet_id      = aws_subnet.test-priv-sub1.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}

# Private Route Association 2
resource "aws_route_table_association" "Test-priv-route-table-association-2" {
  subnet_id      = aws_subnet.test-priv-sub2.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}

# Internet Gateway
resource "aws_internet_gateway" "Test-igw" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  tags = {
    Name = "Test-igw"
  }
}

# IGW Route
resource "aws_route" "Test-igw-association" {
  route_table_id            = aws_route_table.Test-pub-route-table.id
  gateway_id                = aws_internet_gateway.Test-igw.id
  destination_cidr_block    = "0.0.0.0/0"
}
#Nat Gateway Association
# Nat Gateway 1
resource "aws_nat_gateway" "Test-Nat-gateway1" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.test-priv-sub1.id
}

# Nat Gateway 2
resource "aws_nat_gateway" "Test-Nat-gateway2" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.test-priv-sub2.id
}

