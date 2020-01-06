resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "Client-VPC"
    Environment = "test"
  }  
}

resource "aws_subnet" "mysubnet" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Client-Frontend-Subnet"
    Environment = "test"
  } 
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "client-igw"
  }
}


resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }


  tags = {
    Name = "client-publicrt"
  }
}


resource "aws_route_table_association" "publicrt" {
  subnet_id      = "${aws_subnet.mysubnet.id}"
  route_table_id = "${aws_route_table.main.id}"
}
