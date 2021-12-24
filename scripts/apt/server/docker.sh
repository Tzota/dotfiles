#!/usr/bin/env bash
set -euo pipefail

echo '-------------------1'

# https://docs.docker.com/install/linux/docker-ce/ubuntu/

# SET UP THE REPOSITORY

sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo '-------------------2'

# curl -fsSL https://download.docker.com/linux/ubuntu/gpg > /tmp/docker.gpg
# apt-key add /tmp/docker.gpg

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo '-------------------3'
# LINE="deb https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# add-apt-repository $LINE
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# INSTALL DOCKER ENGINE - COMMUNITY

echo '-------------------4'
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

echo '-------------------5'
# https://docs.docker.com/install/linux/linux-postinstall/
# rm -rf ~/.docker/
sudo groupadd docker
sudo usermod -aG docker $USER

#sudo docker run hello-world
