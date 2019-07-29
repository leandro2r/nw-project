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

```shell
$ [sudo] make install
```
