resource "aws_security_group" "allow_http_public" {
  name        = "allow_http_internet"
  description = "Allow http inbound traffic"
  vpc_id      = aws_vpc.VPC_Prod.id

  ingress {
    description      = "allow http from internet"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}

resource "aws_security_group" "allow_http_from_alb" {
  name        = "allow_http_alb"
  description = "Allow http inbound traffic"
  vpc_id      = aws_vpc.VPC_Prod.id

  ingress {
    description      = "allow http from internet"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups = [aws_security_group.allow_http_public.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}