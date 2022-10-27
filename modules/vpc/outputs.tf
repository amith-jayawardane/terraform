output "alb_sg_id" {
  value = aws_security_group.allow_http_public.id
}

output "public_alb_subenet_az1" {
  value = aws_subnet.public_alb_subenet_az1.id
}

output "public_alb_subenet_az2" {
  value = aws_subnet.public_alb_subenet_az2.id
}

output "vpc_id" {
  value = aws_vpc.VPC_Prod.id
}

output "web_subenet_az1" {
  value = aws_subnet.web_subenet_az1.id
}

output "web_subenet_az2" {
  value = aws_subnet.web_subenet_az2.id
}

output "asg_sg_id" {
  value = aws_security_group.allow_http_from_alb.id
}