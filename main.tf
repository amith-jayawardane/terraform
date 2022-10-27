module "VPC_Prod" {
  source = "./modules/vpc"
}

module "IAM" {
  source = "./modules/iam"
}

module "ALB" {
  source = "./modules/alb"
  alb_security_group_id = module.VPC_Prod.alb_sg_id
  alb_subnet_1_id = module.VPC_Prod.public_alb_subenet_az1
  alb_subnet_2_id = module.VPC_Prod.public_alb_subenet_az2
  vpc_id = module.VPC_Prod.vpc_id
}

module "S3" {
  source = "./modules/s3"
}

module "ASG" {
  source = "./modules/asg"
  web_subnet_1_id = module.VPC_Prod.web_subenet_az1
  web_subnet_2_id = module.VPC_Prod.web_subenet_az2
  alb_target_group_arn = module.ALB.target_group_arn
  s3_access_role_arn = module.IAM.s3_access_role_arn
  asg_security_group_id = module.VPC_Prod.asg_sg_id
  depends_on = [module.S3] 
}

