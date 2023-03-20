resource "aws_vpc" "test" {
  cidr_block = "10.0.0.0/16"

  tags = {
    name = "main"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.test.id
  cidr_block              = "10.0.0.0/16"
  availability_zone       = "us-east-1a"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.test.id

  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "subnet_route" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id
}