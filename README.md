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

After building, the vagrant box will be output in the `boxes/` directory.

## Thanks

Big thanks to [Pierre Mavro](https://github.com/deimosfr) for [packer-debian](https://github.com/deimosfr/packer-debian) which served as a foundation and taught me a lot about Debian in the process.

## Next steps

* Document what everything in the scripts directory does
* Get sudo working for vagrant without neeeding sudo (optional)
