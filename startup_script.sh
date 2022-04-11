#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y
sudo service nginx start
sudo service nginx enable
sudo rm /usr/share/nginx/html/index.html
sudo echo 'Instance id: '$(curl -s http://169.254.169.254/latest/meta-data/instance-id)'
Local IP:  '$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)'
Public IP:  '$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)'' | sudo tee /usr/share/nginx/html/index.html