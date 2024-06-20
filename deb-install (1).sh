#!/bin/bash

set -e -o pipefail

ARCH_RAW=$(uname -m)
case "${ARCH_RAW}" in
    'x86_64')    ARCH='amd64';;
    'x86' | 'i686' | 'i386')     ARCH='386';;
    'aarch64' | 'arm64') ARCH='arm64';;
    'armv7l')   ARCH='armv7';;
    's390x')    ARCH='s390x';;
    *)          echo "Unsupported architecture: ${ARCH_RAW}"; exit 1;;
esac

curl -Lo sing-box.deb "https://github.com/SagerNet/sing-box/releases/download/v1.9.0/sing-box_1.9.0_linux_${ARCH}.deb"
sudo dpkg -i sing-box.deb
rm sing-box.deb

