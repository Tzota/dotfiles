#!/usr/bin/env bash
set -euo pipefail

RB_IP=192.168.1.104

mkdir -p ./files/boot
scp pi@$RB_IP:/boot/config.txt ./files/boot/config.txt
