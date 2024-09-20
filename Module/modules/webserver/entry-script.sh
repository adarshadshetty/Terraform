#!/bin/bash
sudo yum update -y && sudo yum install -y docker
sudo systemctl start docker
sudo usermod -aG docker $USER
sudo -u $USER docker run -d -p 8080:80 nginx  # Run Docker as the user
