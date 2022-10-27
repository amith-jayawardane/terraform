resource "aws_launch_configuration" "web_server_launch_config" {
  name_prefix   = "web-server-"
  image_id      = "ami-094bbd9e922dc515d"
  instance_type = "t2.micro"
  key_name = "ec2_kp"
  security_groups = [var.asg_security_group_id]
  user_data       = file("./modules/asg/user-data.sh")

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web_server_asg" {
  name                      = "web_server_asg"
  max_size                  = 3
  min_size                  = 3
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 3
  force_delete              = true
  launch_configuration      = aws_launch_configuration.web_server_launch_config.name
  vpc_zone_identifier       = [var.web_subnet_1_id, var.web_subnet_2_id]

  tag {
    key                 = "name"
    value               = "web_server"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "alb_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.web_server_asg.id
  alb_target_group_arn   = var.alb_target_group_arn
}