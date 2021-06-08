# wsdd
A leightweight Docker WSD server container image running Steffen Christgau's awesome wsdd, including a healthcheck

wsdd implements a Web Service Discovery host daemon. This enables (Samba) hosts, like your local NAS device or Linux server, to be found by Web Service Discovery Clients like Windows.

The container image includes a healthcheck script that can be used to have Docker determine the health status. The healthcheck script is based on input by Steffen Christgau. In order to use it, it is necessary that the HOSTNAME and LOCALSUBNET environment variables are set appropriately (cf. below).

## Supported environment variables
HOSTNAME: Samba Netbios name to report.

WORKGROUP: Workgroup name

DOMAIN: Report being a member of an AD DOMAIN. Disables WORKGROUP if set. 

LOCALSUBNET: The fixed part of your local network IP4 addresse, with points masked by a double backslash, e.g. "192\\.168\\.1"

## Running container
### From command line
```
docker run --net=host -e HOSTNAME=$(hostname) hihp/wsdd
```

It is important that the container is run with the argument --net=host and that the environment variabel HOSTNAME is set to the same value as your Samba netbios name. (Samba netbios name defaults to the hostname.)

### From docker compose
A docker-compose.yml file could look like the one below. 
```
version: '3.7'

services:
  wsdd:
    image: hihp/wsdd
    container_name: wsdd
    network_mode: host
    environment:
      WORKGROUP: WORKGROUP_NAME
      LOCALSUBNET: "192\\.168\\.1"
      HOSTNAME: NETBIOS_NAME
    restart: always
    healthcheck:
      test: ["CMD", "/usr/src/app/healthcheck"]
      interval: 1m
      timeout: 3s
      retries: 3
      start_period: 10s
```

## Attributions

**wsdd:** Steffen Christgau (https://github.com/christgau/wsdd)

**Container image and basis for readme:** Jonas Pedersen (https://www.github.com/JonasPed/wsdd-docker)
