# create vpc
resource "aws_vpc" "vpc" {
  cidr_block              = var.VPC_CIDR
  instance_tenancy        = "default"
  enable_dns_hostnames    = true
  enable_dns_support =  true

  tags      = {
    Name    = "${var.project_name}-vpc"
  }
}
#create internet gw
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}

#use data source to get all availability zone 
data "aws_availability_zones" "available_zones" {}

  
#create public subnet az1
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.PUB_SUB_1_A_CIDR
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "public subnet az1"
  }
} 

#create public subnet az2
resource "aws_subnet" "public_subnet_az2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.PUB_SUB_2_B_CIDR
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "public subnet az2"
  }
}


#Public Route Table to add public subnets
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public route table"
  }
}

#associate public subnet az1 to the public route table
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table
}

#associate public subnet az2 to the public route table
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}


#create private data subnet az1
resource "aws_subnet" "private_data_subnet_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.PRI_SUB_3_A_CIDR
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false
  tags = {
    Name = "private data subnet az1"
  }
} 

#create private data subnet az2
resource "aws_subnet" "private_data_subnet_az2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.PRI_SUB_4_B_CIDR
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "private data subnet az2"
  }
}
