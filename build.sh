#!/bin/bash

docker build -t luszczynski/eap-base .
docker build -t luszczynski/eap-domain .
docker build -t luszczynski/eap-host .
docker build -t luszczynski/ews .