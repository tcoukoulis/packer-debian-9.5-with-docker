#!/bin/bash --

# Define the composer version to download
COMPOSE_VERSION="1.23.1"

# Define the expected SHA256 hash for the downloaded file
COMPOSE_HASH="c176543737b8aea762022245f0f4d58781d3cb1b072bc14f3f8e5bb96f90f1a2"

# Define the download path for Docker Compose
COMPOSE_URL="https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-Linux-x86_64"

# Define where to save the downloaded file
COMPOSE_TARGET="/home/vagrant/lib"

# Define the downloaded file name
COMPOSE_FILE="$COMPOSE_TARGET/docker-compose"

curl -L $COMPOSE_URL -o $COMPOSE_FILE

# Get SHA256 hash from downloaded file
FILE_HASH="`sha256sum $COMPOSE_FILE | cut -d ' ' -f 1`"

# If hash check passes enable file to be executable, otherwise bail
if [ "$FILE_HASH" = "$COMPOSE_HASH" ]
then
	chmod +x $COMPOSE_FILE
else
	echo "Downloaded file hash did not meet expectations"
	exit 1
fi
