#!/usr/bin/env bash
set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color

echo $PROJECT_NAME
cd $CMD_PATH

apt update -y

export DEBIAN_FRONTEND=noninteractive

wget http://archive.build.openkylin.top/openkylin/pool/main/d/debootstrap/debootstrap_1.0.118-ok3_all.deb

apt install  -y ./debootstrap_1.0.118-ok3_all.deb
debootstrap --arch=amd64 --no-check-gpg --variant=minbase --include=apt,ca-certificates,locales,sudo,systemd,openkylin-keyring --components=main,cross,pty yangtze /rootfs  http://archive.build.openkylin.top/openkylin/
