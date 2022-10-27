# terraform-aws-asg-alb
## Changes Required
- [provider.tf] : Need to configure AWS access_key and secret_key 
- [user-data.sh] : Need to configure AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY


[provider.tf]: <https://github.com/amith-jayawardane/terraform-aws-asg-alb/blob/main/provider.tf>
[user-data.sh]: <https://github.com/amith-jayawardane/terraform-aws-asg-alb/blob/main/modules/asg/user-data.sh>

## How to Run
```sh
terraform init
terraform plan
terraform apply
```

## Improvements Required
|Improvement|Reason|
|----------|-------|
|Integrating WAF with ALB|To improve the security|
|Enabling HTTPS as the listener and configure redirection rule|To improve security using encryption in transit|
|Assigning role to the EC2 servers|Providing AWS credentials as environment variables is not secure|
|Encrypt bucket objects|Encryption at rest to improve security|
