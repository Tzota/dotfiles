#!/usr/bin/env bash
set -euo pipefail

# current dir https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../.." >/dev/null 2>&1 && pwd )"


ln -sf $DIR/.oh-my-zsh/custom/plugins/arc ~/.oh-my-zsh/custom/plugins/arc
ln -sf $DIR/.oh-my-zsh/custom/babun.zsh-theme ~/.oh-my-zsh/custom/babun.zsh-theme
ln -sf $DIR/.oh-my-zsh/custom/bash_aliases.zsh ~/.oh-my-zsh/custom/bash_aliases.zsh

grep -qxF 'source ~/.tzotarc' ~/.zshrc || printf "\n#моё\nif [ -f ~/.tzotarc ]; then\n  source ~/.tzotarc\nfi\n" >> ~/.zshrc
