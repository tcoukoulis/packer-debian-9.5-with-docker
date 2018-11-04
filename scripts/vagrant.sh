#!/bin/bash

VAGRANT_USER="vagrant"
HOMEDIR=`su - $VAGRANT_USER -c 'echo $HOME'`

# Adds the vagrant public key to the vagrant user
mkdir -p $HOMEDIR/.ssh
chmod 700 $HOMEDIR/.ssh
curl -L 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -o $HOMEDIR/.ssh/authorized_keys
chown -Rf $VAGRANT_USER. $HOMEDIR/.ssh
chmod 600 $HOMEDIR/.ssh/authorized_keys
