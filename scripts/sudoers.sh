#!/bin/sh

# Set up password-less sudo for user vagrant
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/vagrant
chmod 440 /etc/sudoers.d/vagrant

# Enables sudo from within scripts outside the terminal
echo "Defaults !requiretty" >> /etc/sudoers
