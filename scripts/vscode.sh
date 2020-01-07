#!/bin/bash

# current dir https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"


ln -s $DIR/.config/Code/User/snippets ~/.config/Code/User/snippets
ln -s $DIR/.config/Code/User/keybindings.json ~/.config/Code/User/keybindings.json
ln -s $DIR/.config/Code/User/settings.json ~/.config/Code/User/settings.json
