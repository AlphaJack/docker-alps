# Docker Alps

![DockerHub Image Deployment](https://github.com/AlphaJack/docker-alps/actions/workflows/dockerhub.yml/badge.svg)

Unofficial Dockerfile for [alps](https://git.sr.ht/~migadu/alps), a simple and extensible webmail.

## Usage

To use the image, pull it from [DockerHub](https://hub.docker.com/alphajack/alps) and create a container that passes the `ALPS_PARAMETERS` environmental variable with alps options and server URLs.

Example docker-compose file:

```yml
version: "3"
services:
  alps:
   image: docker.io/alphajack/alps:latest
   restart: on-failure
   environment:
     - ALPS_PARAMETERS="-theme alps imaps://mail.example.org:993 smtps://mail.example.org:465 caldavs://calendar.example.org carddavs://contacts.example.org"
   ports:
     - "8080:1323"
```

Official documentation for alps is available [here](https://git.sr.ht/~migadu/alps/tree/master/item/docs).
