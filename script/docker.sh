#!/bin/bash

# Update and install prerequisites
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key and set up the stable repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install Docker
sudo apt-get update
sudo apt-get install -y docker-ce

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

newgrp docker
sudo chmod 777 /var/run/docker.sock

# Add the vagrant user to the docker group
sudo usermod -aG docker vagrant

# Lancer un conteneur SonarQube
      # docker run -d --name sonarqube -p 9000:9000 sonarqube
      docker run -d --name sonar -p 9000:9000 sonarqube:lts-community


