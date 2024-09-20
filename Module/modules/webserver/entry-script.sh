#!/bin/bash
sudo yum update -y && sudo yum install -y docker
sudo systemctl start docker
sudo usermod -aG docker $USER
# sudo docker run -p 8080:80 nginx 

newgrp docker <<EOF
  docker run -d -p 8080:80 nginx  # Run Docker in detached mode
EOF