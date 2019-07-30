NW Project
===
## Setup

### Requirements

#### Linux distribution

This project can only be installed on Linux distributions specially Ubuntu Bionic (18.04)

#### Vagrant and Virtualbox:

```shell
$ [sudo] apt update
$ [sudo] apt install -y vagrant virtualbox
```

## Installation guide

After the requirements installed on your environment, now you just have to follow these next steps below:

### Steps

First step is run the Vagrant to create the virtual machines that are gonna be used.

```shell
$ [sudo] make install
$ nw start
```

Finnaly, we have our infra in one step provided by tools such as Docker, Vagrant, and Chef.
