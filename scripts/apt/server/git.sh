#!/usr/bin/env bash
set -euo pipefail

add-apt-repository ppa:git-core/ppa

apt-get update

apt-get install git
