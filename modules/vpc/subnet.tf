resource "aws_subnet" "public_alb_subenet_az1" {
  vpc_id     = aws_vpc.VPC_Prod.id
  cidr_block = "172.16.16.0/27"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "public_alb_subenet_az1"
  }
}

resource "aws_subnet" "public_alb_subenet_az2" {
  vpc_id     = aws_vpc.VPC_Prod.id
  cidr_block = "172.16.16.32/27"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "public_alb_subenet_az2"
  }
}

resource "aws_subnet" "web_subenet_az1" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
  cidr_block = "172.16.17.0/28"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "web_subenet_az1"
  }
}

resource "aws_subnet" "web_subenet_az2" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
  cidr_block = "172.16.17.16/28"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "web_subenet_az2"
  }
}

resource "aws_subnet" "public_nat_subnet_az1" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.secondary_cidr_nat.vpc_id
  cidr_block = "172.16.18.0/28"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "public_nat_subenet_az1"
  }
}

resource "aws_subnet" "public_nat_subnet_az2" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.secondary_cidr_nat.vpc_id
  cidr_block = "172.16.18.16/28"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "public_nat_subenet_az2"
  }
}