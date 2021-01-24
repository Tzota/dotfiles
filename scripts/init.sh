#!/usr/bin/env bash
#set -euo pipefail

# current dir https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"

ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.XCompose ~/.XCompose
ln -s $DIR/.prettierrc ~/.prettierrc
ln -s $DIR/.tmux.conf ~/.tmux.conf
ln -s $DIR/.tzotarc ~/.tzotarc

grep -qxF 'source ~/.tzotarc' ~/.bashrc || printf "\n\nsource ~/.tzotarc" >> ~/.bashrc

grep -qx 'fs.inotify.max_user_watches=524288' /etc/sysctl.conf || printf "\n\n# tzota - fs watch\nfs.inotify.max_user_watches=524288\n\n" >> /etc/sysctl.conf
