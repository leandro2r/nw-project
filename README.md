NW Project
===
## About

This project is composed by tools using some technologies such as container (Docker swarm and docker-compose), virtualization (Vagrant), infra as code (Chef). In addition, other stuffs as Makefile, shell script, systemd files, and cronjob were here too.

**All services are provided just in a period of time between 8h~18h. So, if you want to use it, try out only on business hours.**

## Setup

### Requirements

This project is recommended to install using any of Linux distributions specially Ubuntu Bionic (18.04).

Next you can use one of these options as requirements:

#### Vagrant and Virtualbox (Default)

```shell
$ [sudo] apt update
$ [sudo] apt install -y vagrant virtualbox dkms virtualbox-dkms
```

#### Docker and Docker-compose

```shell
$ [sudo] apt update
$ [sudo] apt install -y docker.io
$ [sudo] usermod -aG docker $(whoami)
```

```shell
$ [sudo] curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ [sudo] chmod +x /usr/local/bin/docker-compose
```

## Installation guide

After the requirements installed on your environment, now you just have to follow these next steps below:

### Steps

First step is run the Vagrant to create the virtual machines that are gonna be used.
And then, you can access it through http://localhost:8081 or http://localhost:8082

#### Default

```shell
$ [sudo] make all
$ [sudo] nw start
```

#### Docker-compose

```shell
$ docker-compose up
```

## Management

There is a host command called `nw` which it provides management options on NW Project service. Those options are:

```shell
$ [sudo] nw {destroy|reload|start|status|stop}
```

To follow the infrastructure status, we added the [lazydocker](https://github.com/jesseduffield/lazydocker) container interface, through the command:

```shell
$ [sudo] nw status
```

On that view has CPU, Memory, Logs, and more management stuffs in an easy way of usage.
