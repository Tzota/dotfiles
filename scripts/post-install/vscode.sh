#!/usr/bin/env bash
set -euo pipefail

# current dir https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"


ln -sf $DIR/.config/Code/User/snippets ~/.config/Code/User/snippets
ln -sf $DIR/.config/Code/User/keybindings.json ~/.config/Code/User/keybindings.json
ln -sf $DIR/.config/Code/User/settings.json ~/.config/Code/User/settings.json
