#!/bin/bash
sudo yum update -y && sudo yum install docker -y
sudo systemctl start docker
sudo usermod -aG docker ec2-user #adding ec2@user to docker group to run docker commnads
docker run -p 8080:80 nginx 