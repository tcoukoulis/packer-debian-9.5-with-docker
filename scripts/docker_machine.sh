#!/bin/bash --

# Define the component name
COMPONENT="machine"

# Define the machine version to download
VERSION="0.16.0"

# Define the expected SHA256 hash for the downloaded file
CANONICAL_HASH="3d2cae5f66df636116153c8a96310c0cdef0060b1ecfe86116cec825bbf393d8"

# Define the download path for Docker Compose
URL="https://github.com/docker/$COMPONENT/releases/download/v$VERSION/docker-$COMPONENT-Linux-x86_64"

# Define where to save the downloaded file
TARGET_DIR="/home/vagrant/lib"

# Define the downloaded file name
FILE="$TARGET_DIR/docker-$COMPONENT"

curl -L $URL -o $FILE

# Get SHA256 hash from downloaded file
FILE_HASH="`sha256sum $FILE | cut -d ' ' -f 1`"

# If hash check passes enable file to be executable, otherwise bail
if [ "$CANONICAL_HASH" = "$FILE_HASH" ]
then
	chmod +x $FILE
else
	echo "Downloaded file hash did not meet expectations"
	exit 1
fi
