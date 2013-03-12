# OpenAM Vagrant

Get an instance of [OpenAM](http://forgerock.com/what-we-offer/open-identity-stack/openam/) up and running using Vagrant and Puppet.

## Getting started

Before you start, ensure you have [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/) installed and working.

1. `git clone https://github.com/phinze/openam-vagrant.git && cd openam-vagrant`
2. `cp puppet/nodes/openam.pp{.example,}`
3. `vagrant up`

That's it! The VM will be created and Puppet will download and configure OpenAM for you.

OpenAM will be available on port 8080 of `localhost` by default. I recommend setting up [pow](https://github.com/37signals/pow) or an equivalent to redirect `openam.vagrant.dev` to port 8080.

Assuming you have pow set up, that's as simple as `echo 8080 > ~/.pow/openam.vagrant`.

## Configuration

Currently I'm just having this set up a default identity provider, but soon I'll fill in more details about the Puppet types provided and how to configure OpenAM with them. For now you can poke around the source; feel free to open an issue with a question if you have one.
