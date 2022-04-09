#!/usr/bin/env bash
set -euo pipefail

add-apt-repository ppa:noobslab/indicators
apt-get update
apt-get install indicator-multiload

apt-add-repository ppa:diesch/testing
apt-get update
apt-get install classicmenu-indicator

apt-get install dconf-editor
