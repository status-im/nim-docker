# nim-docker [![Build Status](https://travis-ci.org/status-im/nim-docker.svg?branch=master)](https://travis-ci.org/status-im/nim-docker)

This is a helper repo for auto building docker image with latest [Nim](https://github.com/nim-lang/Nim) devel version. In order to setup [Travis CI](https://travis-ci.org) for your project using this image, copy the following lines to your `.travis.yml` file in the root of your repository:
```yml
sudo: required
services:
  - docker
before_install:
  - docker pull statusteam/nim-base
script:
  - docker run statusteam/nim-base nim --version
  - docker run -v "$(pwd):/project" -w /project statusteam/nim-base nimble test
```
Also make sure to enable your project in [Travis CI](https://travis-ci.org). This configuration will run `nimble test` in the root of your repository.
