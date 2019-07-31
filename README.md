NW Project
===
## Setup

### Requirements

This project is recommended to install using any of Linux distributions specially Ubuntu Bionic (18.04).

Next you can use one of these options as requirements:

#### Vagrant and Virtualbox (Default)

```shell
$ [sudo] apt update
$ [sudo] apt install -y vagrant virtualbox
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

Finnaly, we have our infra in one step provided by tools such as Vagrant, Docker, and Chef.

#### Default

```shell
$ [sudo] make all
$ nw start
```

#### Docker-compose

```shell
$ docker-compose up
```
