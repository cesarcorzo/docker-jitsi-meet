#!/bin/bash

# This requires sudo or root privileges
# Get docker convenient script
curl -fsSL https://get.docker.com -o get-docker.sh
# Install docker
sudo sh get-docker.sh

# Instal docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose

# Install snd_loop the module and other libraries
sudo apt install linux-image-extra-virtual
# Setup autoload the module
sudo echo "snd-aloop" >> /etc/modules
# Load the module into the running kernel
sudo modprobe snd-aloop
# Check that the module is loaded
lsmod | grep snd_aloop

# Build environment file
cp env.example .env
./gen-passwords.sh