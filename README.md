NW Project
===
## Setup

### Requirements

#### Docker:

**[Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/):**
```shell
$ [sudo] apt install docker.io
$ [sudo] usermod -aG docker $(whoami)
```

#### Docker-compose:

**[Offical repository](https://github.com/docker/compose)**

**[Ubuntu](https://docs.docker.com/compose/install/):**
```shell
$ [sudo] curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ [sudo] chmod +x /usr/local/bin/docker-compose
```

## Installation guide

After the requirements installed on your environment, now you just have to follow these next steps below:

### Steps

First step is run the Vagrant docker-compose to create the virtual machines that are gonna be used.

```shell
$ [sudo] docker-compose -f docker-compose.vagrant.yml up -d
```

Finnaly, we have our infra in one step provided by tools such as Docker, Vagrant, and Chef.
