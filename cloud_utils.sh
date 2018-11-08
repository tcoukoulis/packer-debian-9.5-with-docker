#!/bin/bash --

# Import variables
source .env

# Create a new vagrant box
create_box() {
    curl \
        --header "Content-Type: application/json" \
    	--header "Authorization: Bearer $VAGRANT_ACCESS_TOKEN" \
	https://app.vagrantup.com/api/v1/boxes \
	--data "{ \"box\": { \"username\": \"$VAGRANT_USERNAME\", \"name\": \"$VAGRANT_BOX_NAME\", \"short_description\": \"Debian $OS_VERSION with Docker for Vagrant.\" } }"
}

# Create a new vagrant box version
create_box_version() {
    curl \
        --header "Content-Type: application/json" \
    	--header "Authorization: Bearer $VAGRANT_ACCESS_TOKEN" \
	https://app.vagrantup.com/api/v1/box/$VAGRANT_USERNAME/$VAGRANT_BOX_NAME/versions \
	--data "{ \"version\": { \"version\": \"$VAGRANT_BOX_VERSION\" } }"
}

# Create a new vagrant box providers
create_provider() {
    curl \
        --header "Content-Type: application/json" \
    	--header "Authorization: Bearer $VAGRANT_ACCESS_TOKEN" \
	https://app.vagrantup.com/api/v1/box/$VAGRANT_USERNAME/$VAGRANT_BOX_NAME/version/$VAGRANT_BOX_VERSION/providers \
	--data "{ \"provider\": { \"name\": \"$VAGRANT_PROVIDER\" } }"
}

# Upload the box image to Vagrant Cloud
upload_box() {
    RESPONSE=$(curl \
    	--header "Authorization: Bearer $VAGRANT_ACCESS_TOKEN" \
	https://app.vagrantup.com/api/v1/box/$VAGRANT_USERNAME/$VAGRANT_BOX_NAME/version/$VAGRANT_BOX_VERSION/provider/$VAGRANT_PROVIDER/upload)
    `which jq > /dev/null`
    if [ $? -ne 0 ]
    then
	echo "The jq library is required for this functionality"
	return 1
    fi
    UPLOAD_PATH=$(echo "$RESPONSE" | jq .upload_path | tr -d '"')
    curl --progress-bar \
	--request PUT \
	-T boxes/debian-$OS_VERSION-amd64-virtualbox.box $UPLOAD_PATH \
	| tee /dev/null
}

# Release the latest Vagrant box version
release_box() {
    curl \
    	--header "Authorization: Bearer $VAGRANT_ACCESS_TOKEN" \
	https://app.vagrantup.com/api/v1/box/$VAGRANT_USERNAME/$VAGRANT_BOX_NAME/version/$VAGRANT_BOX_VERSION/release \
	--request PUT
}
