# EAP Domain Demo

## Pre-req

* Docker
* Docker Compose

## Usage

Clone this repo:
```bash
git clone https://github.com/luszczynski/docker-eap-domain-demo.git
```

Copy EAP binaries to eap-base/software folder.

Execute docker compose
```bash
docker-compose up
```

docker inspect --format '{{ .NetworkSettings.Networks.dockereapdomain_default.IPAddress }}' $(docker ps | grep eap-domain | awk '{print $1}')
