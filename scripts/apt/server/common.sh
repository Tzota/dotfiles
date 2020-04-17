#!/usr/bin/env bash
set -euo pipefail

apt-get update
apt-get upgrade

apt-get install curl vim xclip tmux tree zsh
