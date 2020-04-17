#!/usr/bin/env bash
set -euo pipefail

# https://docs.docker.com/install/linux/docker-ce/ubuntu/

# SET UP THE REPOSITORY

apt-get update

apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg > /tmp/docker.gpg
apt-key add /tmp/docker.gpg

# LINE="deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
LINE="deb https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

add-apt-repository $LINE

# INSTALL DOCKER ENGINE - COMMUNITY

apt-get update

apt-get install docker-ce docker-ce-cli containerd.io

docker run hello-world

# https://docs.docker.com/install/linux/linux-postinstall/
# rm -rf ~/.docker/
# groupadd docker
usermod -aG docker $USER
