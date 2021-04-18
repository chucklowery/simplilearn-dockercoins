# Simplilearn Dockercoins

[![Build & Test](https://github.com/chucklowery/simplilearn-dockercoins/actions/workflows/ci.yaml/badge.svg?branch=docker)](https://github.com/chucklowery/simplilearn-dockercoins/actions/workflows/ci.yaml)

A set of applications to demonstrate microservices interacting within a docker enviroment.

### Differences between main and Docker branches
 - Listening ports of applications switched from 80 to 8080; moved from reserved ports to user accessible ports
 - Docker files installed into each service directory; docker files describe the enviroments for each microservice
   - worker
   - hasher
   - rng
   - webui
 - A workflow is setup in .github/workflows describes how to test the system
 - A script to setup all services is provided in script/enviroment.sh this scripted is used in both the actions workflow and can be used in the learning enviroment to setup a single host enviorment with all services

<img src="dockercoins-diagram.svg" width="800" align="left">
