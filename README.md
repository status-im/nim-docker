**nim-docker [![Build Status](https://travis-ci.org/status-im/nim-docker.svg?branch=master)](https://travis-ci.org/status-im/nim-docker)**

# Introduction

This is a helper repo for auto-building a docker image with the latest [Nim](https://github.com/nim-lang/Nim) development version along with Status patches. To set up [Travis CI](https://travis-ci.org) for your project by using this image, copy the following lines to your `.travis.yml` file in the root of your repository:
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
The docker build script will automatically merge all branches from the 
[status-im/nim](https://github.com/status-im/nim) repo, starting with `status-autopatch-`.
