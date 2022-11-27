#!/bin/sh
set -uo pipefail

# A script to install Docker Engine

# Remove old installation packages
echo "Remove old installation packages"
sudo apt-get remove docker docker-engine docker.io containerd runc

# Install dependenvies packages
echo "Install dependenvies packages"
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Setup repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Add docker group to the current user
sudo groupadd docker
sudo usermod -aG docker $USER

echo "Installation finished! you need to logout and login again."
