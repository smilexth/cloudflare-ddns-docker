#!/bin/sh

# REMOVE EXISTING IMAGE
docker rmi smilexth/cloudflare-ddns:latest  ;
docker rmi smilexth/cloudflare-ddns:amd64  ;
docker rmi smilexth/cloudflare-ddns:amd64-$1  ;
docker rmi smilexth/cloudflare-ddns:arm64v8 ;
docker rmi smilexth/cloudflare-ddns:arm64v8-$1  ;


# LATEST (AMD64)
docker build -t smilexth/cloudflare-ddns:latest -f ./Dockerfile-amd64 . ;

# ARM64
docker build -t smilexth/cloudflare-ddns:arm64v8 -f ./Dockerfile-arm64v8 . ;
docker build -t smilexth/cloudflare-ddns:arm64v8-$2 -f ./Dockerfile-arm64v8 . ;

# AMD64
docker build -t smilexth/cloudflare-ddns:amd64 -f ./Dockerfile-amd64 . ;
docker build -t smilexth/cloudflare-ddns:amd64-$2 -f ./Dockerfile-amd64 . ;


# PUSH ALL
docker push smilexth/cloudflare-ddns:latest
docker push smilexth/cloudflare-ddns:arm64v8
docker push smilexth/cloudflare-ddns:arm64v8-$2
docker push smilexth/cloudflare-ddns:amd64
docker push smilexth/cloudflare-ddns:amd64-$2