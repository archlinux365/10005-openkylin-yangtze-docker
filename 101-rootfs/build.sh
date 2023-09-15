#!/usr/bin/env bash
set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color

echo $PROJECT_NAME
cd $CMD_PATH

apt update -y

export DEBIAN_FRONTEND=noninteractive

apt install debootstrap -y
debootstrap --arch=amd64 --no-check-gpg --variant=minbase --include=apt,ca-certificates,locales,sudo,systemd,openkylin-keyring --components=main,cross,pty,yangtze /rootfs yangtze http://archive.build.openkylin.top/openkylin/
