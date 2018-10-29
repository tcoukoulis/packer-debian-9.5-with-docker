# Packer Debian 9.5 with Docker for Vagrant

## Purpose

I wanted a Vagrant base box that used Debian 9.5 with Docker installed by default. I couldn't find one pre-built, so...

## Requirements

* [Packer](https://www.packer.io/)

## Build

```
packer build debian-9.5-stretch.json
```

## Next steps

* build the vagrant box
