ARG node_version=10.16.3
ARG curl_base=alpine

# alpine + curl
FROM alpine:3.5 AS alpine_curl_base
RUN apk add --no-cache curl

# ubuntu + curl
# A reference of how to have curl and tar xz on ubuntu
#
# FROM ubuntu:bionic AS ubuntu_curl_base
# RUN apt update
# RUN apt install -y ca-certificates curl xz-utils

# nodejs downloader
FROM ${curl_base}_curl_base
ARG node_version
ENV download_url=https://nodejs.org/dist/v${node_version}/node-v${node_version}-linux-x64.tar.xz
WORKDIR "/opt/node"
RUN curl -sL ${download_url} | tar vxJ --strip-components=1
