ARG node_version=10.16.3

# alpine + curl
FROM alpine:3.7 AS curl_base
RUN apk add --no-cache curl

# nodejs downloader
FROM curl_base
ARG node_version
ENV download_url=https://nodejs.org/dist/v${node_version}/node-v${node_version}-linux-x64.tar.xz
WORKDIR "/opt/node"
RUN curl -sL ${download_url} | tar xJ --strip-components=1
