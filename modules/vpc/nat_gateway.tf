resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public_nat_subnet_az1.id

  tags = {
    Name = "nat_gateway_1"
  }

  depends_on = [aws_internet_gateway.VPC_Prod_igw]
}

resource "aws_eip" "nat_gateway" {
  vpc = true
}