[![Build Status](https://github.com/jonakoudijs/docker-forest/actions/workflows/build.yml/badge.svg)](https://github.com/jonakoudijs/docker-forest/actions)
[![CodeFactor](https://www.codefactor.io/repository/github/jonakoudijs/docker-forest/badge)](https://www.codefactor.io/repository/github/jonakoudijs/docker-forest)
[![Docker Pulls](https://img.shields.io/docker/pulls/jonakoudijs/forest.svg)](https://hub.docker.com/r/jonakoudijs/forest)
[![Image Size](https://img.shields.io/docker/image-size/jonakoudijs/forest/latest.svg)](https://hub.docker.com/r/jonakoudijs/forest)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

# The Forest Server Docker Image

Dedicated server of The Forest on Ubuntu. The server software of The Forest is
only available on Windows and therefor running with Wine in this image. The
image is automatically rebuild every week.

## Tags

* [`latest`](Dockerfile)

## Usage

### Run with default configuration
```shell
docker run --name forest -d \
  -p 27015:27015/tcp -p 27015:27015/udp \
  -p 27016:27016/tcp -p 27016:27016/udp \
  -p 8766:8766/tcp   -p 8766:8766/udp \
  jonakoudijs/forest:latest
```
### Run and persist server saves
```shell
docker volume create forest-saves
```
```shell
docker run --name forest -d \
  -v forest-saves:/data/saves \
  -p 27015:27015/tcp -p 27015:27015/udp \
  -p 27016:27016/tcp -p 27016:27016/udp \
  -p 8766:8766/tcp   -p 8766:8766/udp \
  jonakoudijs/forest:latest
```
### Run interactively for debugging
```shell
docker run -it --entrypoint="" \
  jonakoudijs/forest:latest /bin/bash
```

## Configuration

The configuration of the server can be done in the [`server.cfg`](config/server.cfg)
file. The settings can be overwritten by copying a custom version to
`/data/config/server.cfg` or changing the config file and rebuilding the image.

## Sources

* [https://steamcommunity.com/sharedfiles/filedetails/?id=907906289](https://steamcommunity.com/sharedfiles/filedetails/?id=907906289)
* [https://steamcommunity.com/sharedfiles/filedetails/?id=1423538141](https://steamcommunity.com/sharedfiles/filedetails/?id=1423538141)

## License

[MIT license](LICENSE)
