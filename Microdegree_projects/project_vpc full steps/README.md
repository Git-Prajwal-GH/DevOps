










































```
provider "aws" {
  region     = "us-east-1"
  access_key = "****"       # place your user IAM credentials access key from user
  secret_key = "****"       # place your user IAM credentials access key from user
}

# CREATING THE VPC
resource "aws_vpc" "myvpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "MyVPC"
  }
}

# CREATING THE FIRST SUBNET (Public SUBNET)
resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}

# CREATING THE SECOND SUBNET (Private SUBNET)
resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false  # Private subnet should not map public IP

  tags = {
    Name = "Private Subnet"
  }
}

# CREATING THE INTERNET GATEWAY
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "MyIGW"
  }
}

# CREATING THE PUBLIC ROUTE TABLE
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "Public Route Table"
  }
}

# CREATING A ROUTE FOR THE PUBLIC SUBNET
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myigw.id
}

# ASSOCIATING PUBLIC ROUTE TABLE WITH PUBLIC SUBNET
resource "aws_route_table_association" "public_subnet_associate" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}
```
