#!/bin/sh

# Install Docker prerequisites
apt install -y apt-transport-https \
	ca-certificates \
	gnupg2 \
	software-properties-common

# Add Docker GPG key to system
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# Add Docker repo to system
add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/debian \
	$(lsb_release -cs) \
	stable"

# Update the system to include Docker resources
apt update

# Install Docker Community Edition
apt install -y docker-ce
