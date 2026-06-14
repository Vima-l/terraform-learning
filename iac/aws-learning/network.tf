resource "aws_vpc" "my_first_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name ="${local.prefix}-vpc"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.my_first_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "${local.prefix}-public-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.my_first_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "${local.prefix}-private-subnet-1"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_first_vpc.id

  tags = {
    Name = "${local.prefix}-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id         = aws_vpc.my_first_vpc.id
  tags = {
    Name = "${local.prefix}-public-rt"
  }
}

resource "aws_route" "public_internet_route" {
  route_table_id = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_association" {
  subnet_id = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "public_sg" {
  vpc_id = aws_vpc.my_first_vpc.id
  name = "${local.prefix}-public-sg"
  description = "Allow ssh and http traffic in and out"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.prefix}-public-sg"
  }
}
