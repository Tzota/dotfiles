#!/usr/bin/env bash
set -euo pipefail

cd ~
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt-get install nodejs build-essential
rm nodesource_setup.sh
