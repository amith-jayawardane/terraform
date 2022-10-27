resource "aws_iam_role" "s3_access_role" {
  name = "s3_full_access_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "autoscaling.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "s3_full_access_policy"
  description = "s3_full_access_policy"

  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
            "Action": [
                "s3:*"
            ],
            "Effect": "Allow",
            "Resource": "*"
    },
    {
      "Sid":"EC2InstanceManagement",
      "Effect":"Allow",
      "Action":[
        "ec2:AttachClassicLinkVpc",
        "ec2:CancelSpotInstanceRequests",
        "ec2:CreateFleet",
        "ec2:CreateTags",
        "ec2:DeleteTags",
        "ec2:Describe*",
        "ec2:DetachClassicLinkVpc",
        "ec2:ModifyInstanceAttribute",
        "ec2:RequestSpotInstances",
        "ec2:RunInstances",
        "ec2:StartInstances",
        "ec2:StopInstances",
        "ec2:TerminateInstances"
      ],
      "Resource":"*"
    },
    {
      "Sid":"EC2InstanceProfileManagement",
      "Effect":"Allow",
      "Action":[
        "iam:PassRole"
      ],
      "Resource":"*",
      "Condition":{
        "StringLike":{
          "iam:PassedToService":"ec2.amazonaws.com*"
        }
      }
    },
    {
      "Sid":"EC2SpotManagement",
      "Effect":"Allow",
      "Action":[
        "iam:CreateServiceLinkedRole"
      ],
      "Resource":"*",
      "Condition":{
        "StringEquals":{
          "iam:AWSServiceName":"spot.amazonaws.com"
        }
      }
    },
    {
      "Sid":"ELBManagement",
      "Effect":"Allow",
      "Action":[
        "elasticloadbalancing:Register*",
        "elasticloadbalancing:Deregister*",
        "elasticloadbalancing:Describe*"
      ],
      "Resource":"*"
    },
    {
      "Sid":"CWManagement",
      "Effect":"Allow",
      "Action":[
        "cloudwatch:DeleteAlarms",
        "cloudwatch:DescribeAlarms",
        "cloudwatch:GetMetricData",
        "cloudwatch:PutMetricAlarm"
      ],
      "Resource":"*"
    },
    {
      "Sid":"SNSManagement",
      "Effect":"Allow",
      "Action":[
        "sns:Publish"
      ],
      "Resource":"*"
    },
    {
      "Sid":"EventBridgeRuleManagement",
      "Effect":"Allow",
      "Action":[
        "events:PutRule",
        "events:PutTargets",
        "events:RemoveTargets",
        "events:DeleteRule",
        "events:DescribeRule"
      ],
      "Resource":"*",
      "Condition":{
        "StringEquals":{
          "events:ManagedBy":"autoscaling.amazonaws.com"
        }
      }
    },
    {
      "Sid":"SystemsManagerParameterManagement",
      "Effect":"Allow",
      "Action":[
        "ssm:GetParameters"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "s3_access_attach" {
  role       = aws_iam_role.s3_access_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}