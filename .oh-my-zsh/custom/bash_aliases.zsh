#alias tree-2='tree -L 2 -d'
alias cls='tput reset'

alias make_napalm='make clean && git reset --hard && git clean -fxd'
alias bugaga='tail -f /var/log/xscript-multiple/dev-ssl.log | grep bugaga'
alias bugaga='tail -f /var/log/xscript-multiple/dev-ssl.log'

# List directory contents
#alias lsa='ls -lAhF --group-directories-first'
#alias l='ls -lAhF --group-directories-first'
#alias ll='ls -lhF --group-directories-first'
#alias la='ls -lAhF --group-directories-first'

alias -g xcopy='xclip -i -selection clipboard'
alias -g xpaste='xclip -o'
alias gimme_uuid='uuidgen | tr -d "\n" | xcopy'
