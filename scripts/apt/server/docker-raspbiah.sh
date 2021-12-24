#!/usr/bin/env bash
set -euo pipefail

# https://blog.alexellis.io/getting-started-with-docker-on-raspberry-pi/

curl -sSL https://get.docker.com | sh

usermod -aG docker pi

#systemctl enable docker
#systemctl start docker

###########################

# https://www.docker.com/blog/happy-pi-day-docker-raspberry-pi/

# Install the following prerequisites.
#apt-get install apt-transport-https ca-certificates software-properties-common -y

# Download and install Docker.
#curl -sSL https://get.docker.com | sh

#Give the ‘pi’ user the ability to run Docker.
#usermod -aG docker pi

# Import Docker CPG key.
#curl https://download.docker.com/linux/raspbian/gpg > /tmp/docker.gpg
#apt-key add /tmp/docker.gpg

# Setup the Docker Repo.
#Add the following line and save:
#LINE="deb https://download.docker.com/linux/raspbian/ stretch stable"
#echo $LINE >> /etc/apt/sources.list

# Patch and update your Pi.
#apt-get update
#apt-get upgrade

# Start the Docker service.
#systemctl start docker.service

# To verify that Docker is installed and running.
#docker info


