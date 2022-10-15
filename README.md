[![Build Status](https://img.shields.io/github/workflow/status/jonakoudijs/docker-theforest/build.svg?logo=github)](https://github.com/jonakoudijs/docker-theforest/actions)
[![CodeFactor](https://www.codefactor.io/repository/github/jonakoudijs/docker-theforest/badge)](https://www.codefactor.io/repository/github/jonakoudijs/docker-theforest)
[![Docker Pulls](https://img.shields.io/docker/pulls/jonakoudijs/theforest.svg)](https://hub.docker.com/r/jonakoudijs/theforest)
[![Image Size](https://img.shields.io/docker/image-size/jonakoudijs/theforest/latest.svg)](https://hub.docker.com/r/jonakoudijs/theforest)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

# The Forest Server Docker Image

Dedicated server of The Forest on Ubuntu.
SteamCMD on various Docker base images for downloading and running Steam games
and game server software. The images are build automatically every 6 hours with
[Github Actions](https://github.com/steamcmd/docker/actions) and tagged on type
of base image.

The images are automatically rebuild and tested every week.

For detailed information about SteamCMD,
see [wiki](https://developer.valvesoftware.com/wiki/SteamCMD).
Are you looking for a programmatic way to retrieve information via SteamCMD,
have a look at [steamcmd.net](https://www.steamcmd.net).

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

## Sources

* [https://steamcommunity.com/sharedfiles/filedetails/?id=907906289](https://steamcommunity.com/sharedfiles/filedetails/?id=907906289)
* [https://steamcommunity.com/sharedfiles/filedetails/?id=1423538141](https://steamcommunity.com/sharedfiles/filedetails/?id=1423538141)

## License

[MIT license](LICENSE)
