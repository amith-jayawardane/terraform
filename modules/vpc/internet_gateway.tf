resource "aws_internet_gateway" "VPC_Prod_igw" {
  vpc_id = aws_vpc.VPC_Prod.id

  tags = {
    Name = "VPC_Prod_igw"
  }
}