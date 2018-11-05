# Packer Debian 9.5 with Docker for Vagrant

## Purpose

I wanted a Vagrant base box that used Debian 9.5 with Docker installed by default. I couldn't find one pre-built, so...

## Requirements

* [Packer](https://www.packer.io/)
* [Vagrant](https://www.vagrantup.com/)

## Build

```
packer build debian-9.5-stretch.json
```

## Post build

After building, the vagrant box will be output in the `boxes/` directory.

Add it locally using `vagrant box add <box-name> boxes/debian-9.5.0-amd64-virtualbox.box`.

## Thanks

Big thanks to [Pierre Mavro](https://github.com/deimosfr) for [packer-debian](https://github.com/deimosfr/packer-debian) which served as a foundation and taught me a lot about Debian in the process.
