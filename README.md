# Bootstrap EC2

This repo is part of an article on how to bootstrap an EC2 instance with SSM.  It uses [Terraform](https://www.terraform.io/) for the IaC and this will create the following items:-

* EC2 instance running Amazon Linux 2
* SSM Document with Nginx config scripts

## Setup

### Build Environment

In order to this you [Docker](https://docs.docker.com/get-docker/) will need to be installed.  It uses a [3 Musketeers](https://3musketeers.io/) pattern to make it easy to run.

## How to run

To install the IaC run the following script:-

```shell
export AWS_PROFILE=<your profile>
export AWS_REGION=ap-southeast-2
make apply
```

In order to uninstall run:-

```shell
make destroy
```
