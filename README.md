# cloud-setup-puppet-module

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with cloud_setup](#setup)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Description

It sets up a dummy puppet module and the required sdks to do api calls to AWS. This module is required for other modules like cloud-formation-puppet-module.

## Setup

This module requires stdlibs and if it is not there it gets it from puppet forge
It also requires proxy. If not set, it sets it.

## Usage

Modify cloud-setup-puppet-module/tests/ with the right aws_access_key_id & aws_secret_access_key for the unit testing. If you use puppet master to send the parameters make sure you are sending these two parameters.

## Reference

cloud-setup-puppet-module/manifests/init.pp 

## Limitations

Permission to access cloud and user creation by security before you start.


