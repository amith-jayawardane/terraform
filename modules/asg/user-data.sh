#!/bin/bash
sudo su -
yum update -y
amazon-linux-extras install nginx1
echo "test web page" > /usr/share/nginx/html/index.html
systemctl start nginx
systemctl enable nginx
export AWS_ACCESS_KEY_ID=************
export AWS_SECRET_ACCESS_KEY=********************
rm -rf /usr/share/nginx/html/index.html
aws s3 cp s3://web-artifacts-259411494746/index.html /usr/share/nginx/html/index.html