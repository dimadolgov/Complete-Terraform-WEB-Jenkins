############################### VPC + Internet Gateway ###############################
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "VPC-${var.project_name}"
  }
}
# Create an Internet Gateway and associate it with the VPC
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "Internet_Gateway-${var.project_name}"
  }
}
############################### Subnet + Route Table + Sssociation ###############################
# public subnets
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet_Public-${var.project_name}"
  }
}
# route table for public subnets
resource "aws_route_table" "route_tables_public" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "Route_Tables_Public-${var.project_name}"
  }
}
# associate route tables with public subnets
resource "aws_route_table_association" "public_association" {
  count          = length(var.public_subnet_cidr)
  route_table_id = aws_route_table.route_tables_public.id
  subnet_id      = element(aws_subnet.public_subnet[*].id, count.index)
}
