#!/bin/bash --

# Install pass to encrypt docker login information
# Install haveged to generate sufficient entropy for gpg key creation
apt-get install pass haveged -y

# Define the vagrant user directory
VAGRANT_HOME="/home/vagrant"

# Define the target directory
TARGET="$VAGRANT_HOME/lib"

# Make the target directory
mkdir $TARGET

# Update vagrant user PATH with target directory
echo "export PATH=\"\$PATH:$TARGET\"" >> $VAGRANT_HOME/.bashrc

# Change current working directory to target directory
cd $TARGET

# Download the docker-credential-pass helper
curl -O -L https://github.com/docker/docker-credential-helpers/releases/download/v0.6.0/docker-credential-pass-v0.6.0-amd64.tar.gz

# Extract the helper file
tar xf docker-credential-pass-v0.6.0-amd64.tar.gz

# Remove downloaded file
rm *.tar.gz
