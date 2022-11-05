#!/bin/bash
set -e

export GOPROXY=direct
export GOOS=linux
export GOARCH=arm
export GOARM=6
export CGO_ENABLED=1
export CC=arm-linux-gnueabi-gcc # This should be your ARM C cross-compiler

git clone "https://github.com/cloudflare/cloudflared.git"
cd cloudflared/
go build -v "-ldflags=-X 'main.Version=2022.10.3' -X 'main.BuildTime=${date}'" github.com/cloudflare/cloudflared/cmd/cloudflared
cd ../
mkdir output/
mv cloudflared/cloudflared output/
