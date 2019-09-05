# Nodejs download

Nodejs binaries downloaded.

## Versions / Tags

Tags on this project are node versions, so `fczuardi/node_download:10.16.3` should give node `v10.16.3`

## Usage

This image was made for copying node binaries to other images on a 
[multi-stage build](https://docs.docker.com/develop/develop-images/multistage-build/) setup. The files are under `/opt/node`

For example, to have node on a Ubuntu Xenial project you could have a Dockerfile like this:

```Dockerfile
FROM ubuntu:xenial
WORKDIR "/opt/node"
COPY --from=fczuardi/node_download:11.10.1 /opt/node/bin bin
ENV PATH=$PATH:/opt/node/bin
```


