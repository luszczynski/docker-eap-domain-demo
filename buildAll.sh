#!/bin/bash

docker build -t luszczynski/eap-base eap-base/.
docker build -t luszczynski/eap-host eap-host/.
docker build -t luszczynski/eap-domain eap-domain/.
