resource "aws_vpc" "VPC_Prod" {
  cidr_block = "172.16.16.0/26"
  
  tags = {
    Name = "VPC_Prod"
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.VPC_Prod.id
  cidr_block = "172.16.17.0/27"
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr_nat" {
  vpc_id     = aws_vpc.VPC_Prod.id
  cidr_block = "172.16.18.0/27"
}