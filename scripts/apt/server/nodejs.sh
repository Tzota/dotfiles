#!/bin/bash

cd ~
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt-get install nodejs npm build-essential
rm nodesource_setup.sh