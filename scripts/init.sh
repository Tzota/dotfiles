#!/usr/bin/env bash
set -euo pipefail

# current dir https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"

ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.XCompose ~/.XCompose
ln -s $DIR/.prettierrc ~/.prettierrc
ln -s $DIR/.tmux.conf ~/.tmux.conf
ln -s $DIR/.tzotarc ~/.tzotarc

echo "source ~/.tzotarc" >> ~/.bashrc
