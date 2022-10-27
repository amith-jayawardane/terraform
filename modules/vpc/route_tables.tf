resource "aws_route_table" "VPC_Prod_internet_route_table" {
  vpc_id = aws_vpc.VPC_Prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.VPC_Prod_igw.id
  }

  tags = {
    Name = "VPC_Prod_internet_route_table"
  }
}

resource "aws_route_table" "VPC_Prod_nat_gateway_route_table" {
  vpc_id = aws_vpc.VPC_Prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.VPC_Prod_igw.id
  }

  tags = {
    Name = "VPC_Prod_nat_gateway_route_table"
  }
}

resource "aws_route_table" "VPC_Prod_web_server_route_table" {
  vpc_id = aws_vpc.VPC_Prod.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "VPC_Prod_web_server_route_table"
  }
}


resource "aws_route_table_association" "VPC_Prod_internet_route_table_association_1" {
  subnet_id      = aws_subnet.public_alb_subenet_az1.id
  route_table_id = aws_route_table.VPC_Prod_internet_route_table.id
}

resource "aws_route_table_association" "VPC_Prod_internet_route_table_association_2" {
  subnet_id      = aws_subnet.public_alb_subenet_az2.id
  route_table_id = aws_route_table.VPC_Prod_internet_route_table.id
}

resource "aws_route_table_association" "VPC_Prod_nat_gateway_route_table_association_1" {
  subnet_id      = aws_subnet.public_nat_subnet_az1.id
  route_table_id = aws_route_table.VPC_Prod_nat_gateway_route_table.id
}

resource "aws_route_table_association" "VPC_Prod_nat_gateway_route_table_association_2" {
  subnet_id      = aws_subnet.public_nat_subnet_az2.id
  route_table_id = aws_route_table.VPC_Prod_nat_gateway_route_table.id
}

resource "aws_route_table_association" "VPC_Prod_web_server_route_table_association_1" {
  subnet_id      = aws_subnet.web_subenet_az1.id
  route_table_id = aws_route_table.VPC_Prod_web_server_route_table.id
}

resource "aws_route_table_association" "VPC_Prod_web_server_route_table_association_2" {
  subnet_id      = aws_subnet.web_subenet_az2.id
  route_table_id = aws_route_table.VPC_Prod_web_server_route_table.id
}