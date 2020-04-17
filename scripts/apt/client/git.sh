#!/usr/bin/env bash
set -euo pipefail

# Не помню, нужно ли. Возможно, серверный гит всё притащит.

apt-get update

apt-get install git-gui gitk
