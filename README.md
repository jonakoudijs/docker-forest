[![Build Status](https://img.shields.io/github/workflow/status/jonakoudijs/docker-theforest/build.svg?logo=github)](https://github.com/jonakoudijs/docker-theforest/actions)
[![CodeFactor](https://www.codefactor.io/repository/github/jonakoudijs/docker-theforest/badge)](https://www.codefactor.io/repository/github/jonakoudijs/docker-theforest)
[![Docker Pulls](https://img.shields.io/docker/pulls/jonakoudijs/theforest.svg)](https://hub.docker.com/r/jonakoudijs/theforest)
[![Image Size](https://img.shields.io/docker/image-size/jonakoudijs/theforest/latest.svg)](https://hub.docker.com/r/jonakoudijs/theforest)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

# The Forest Server Docker Image

Dedicated server of The Forest on Ubuntu. The server software of The Forest is
only available on Windows and therefor running with Wine in this image. The
image is automatically rebuild and tested every week.

## Tags

* [`latest`](Dockerfile)

## Usage

### Run with default configuration
```shell
docker run -it --rm \
  -p 27015:27015/tcp -p 27015:27015/udp \
  -p 27016:27016/tcp -p 27016:27016/udp \
  -p 8766:8766/tcp   -p 8766:8766/udp \
    jonakoudijs/theforest:latest
```
### Run and persist instance saves
```shell
docker run -v \
  "$(pwd)/saves":$/data/saves
  -it --rm \
  -p 27015:27015/tcp -p 27015:27015/udp \
  -p 27016:27016/tcp -p 27016:27016/udp \
  -p 8766:8766/tcp   -p 8766:8766/udp \
    jonakoudijs/theforest:latest
```

## Configuration

The configuration of the server can be done in the [`server.cfg`](config/server.cfg)
file. The settings can be overwritten by copying a custom version to
`/data/config/server.cfg` or changing the config file and rebuilding it.

## Sources

* [https://steamcommunity.com/sharedfiles/filedetails/?id=907906289](https://steamcommunity.com/sharedfiles/filedetails/?id=907906289)
* [https://steamcommunity.com/sharedfiles/filedetails/?id=1423538141](https://steamcommunity.com/sharedfiles/filedetails/?id=1423538141)

## License

[MIT license](LICENSE)
