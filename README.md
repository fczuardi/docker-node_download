# Nodejs download

Nodejs binaries downloaded.
An image that downloads node binaries from https://nodejs.org/dist/

## Usage

This image was made for copying node binaries to other images on a 
[multi-stage build](https://docs.docker.com/develop/develop-images/multistage-build/) setup.

The files are under `/opt/node`

For example, to have node v11.10.1 on a Ubuntu Xenial project you could have a Dockerfile like this:

**Dockerfile**
```Dockerfile
FROM ubuntu:xenial
WORKDIR "/opt/node"
COPY --from=fczuardi/node_download:11.10.1 /opt/node/bin bin
ENV PATH=$PATH:/opt/node/bin
```

## Versions

Tags on this project are node versions, so `fczuardi/node_download:10.16.3`
should give node `v10.16.3`

### Available tags

Images are auto-generated on Docker hub for the following tags:

- 12.10.0
- 11.10.1
- 10.16.3

To pull one of those existing tags, for example, 11.10.1 use:

```sh
docker pull fczuardi/node_download:11.10.1
```

### (Advanced) Other versions
But if you need a version that is not on the above list, for example 11.14.0, 
you can create a new build locally by reusing the Dockerfile and passing the `node_version` 
build argument:

```sh
git clone https://www.github.com/fczuardi/docker-node_download
cd docker-node_download
docker build -t my-image-name:11.14.0 --build-arg node_version=11.14.0 .
```

