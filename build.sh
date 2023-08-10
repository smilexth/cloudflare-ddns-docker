#!/bin/sh

# REMOVE EXISTING IMAGE
docker rmi -f smilexth/cloudflare-ddns:latest  ;
docker rmi -f smilexth/cloudflare-ddns:amd64  ;
docker rmi -f smilexth/cloudflare-ddns:amd64-$1  ;
docker rmi -f smilexth/cloudflare-ddns:arm64v8 ;
docker rmi -f smilexth/cloudflare-ddns:arm64v8-$1  ;


# ARM64
docker build -t smilexth/cloudflare-ddns:arm64v8 -f ./Dockerfile-arm64v8 . ;
docker build -t smilexth/cloudflare-ddns:arm64v8-$2 -f ./Dockerfile-arm64v8 . ;

# AMD64
docker build -t smilexth/cloudflare-ddns:amd64 -f ./Dockerfile-amd64 . ;
docker build -t smilexth/cloudflare-ddns:amd64-$2 -f ./Dockerfile-amd64 . ;

# LATEST (AMD64)
docker build -t smilexth/cloudflare-ddns:latest -f ./Dockerfile-amd64 . ;
