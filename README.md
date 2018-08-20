**nim-docker [![Build Status](https://travis-ci.org/status-im/nim-docker.svg?branch=master)](https://travis-ci.org/status-im/nim-docker)**

# Introduction

This is a helper repo for auto-building a docker image with the [Nim](https://github.com/status-im/Nim) version that status currently uses for building [Nimbus](http://github.com/status-im/nimbus)

To set up [Travis CI](https://travis-ci.org) for your project by using this image, copy the following lines to your `.travis.yml` file in the root of your repository:
```yml
sudo: required
services:
  - docker
before_install:
  - docker pull statusteam/nim-base
script:
  - docker run statusteam/nim-base nim --version
  - docker run -v "$(pwd):/project" -w /project statusteam/nim-base sh -c "nimble install -dy && nimble test"
```
Also, make sure that your project is enabled in [Travis CI](https://travis-ci.org). This configuration will run `nimble install -dy && nimble test` in the root of your repository.

# Adding Patches

This build follows the nimbus branch of Nim and will automatically update to any version used there - to add a patch to, simple merge it into the nimbus branch
