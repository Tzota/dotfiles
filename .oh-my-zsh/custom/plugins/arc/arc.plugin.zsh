#
# Functions
#

function arc_current_branch() {
  local ref
  ref=$(command arc symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no arc repo.
    ref=$(command arc rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

# Pretty log messages
function _arc_log_prettily(){
  if ! [ -z $1 ]; then
    arc log --pretty=$1
  fi
}
compdef _arc _arc_log_prettily=arc-log

# Warn if the current branch is a WIP
function work_in_progress() {
  if $(arc log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}

#
# Aliases
# (sorted alphabetically)
#

alias arca='arc add'
alias arcaa='arc add --all'
alias arcapa='arc add --patch'
alias arcau='arc add --update'
alias arcav='arc add --verbose'
alias arcap='arc apply'

alias arcb='arc branch'
alias arcba='arc branch -a'
alias arcbd='arc branch -d'
alias arcbdad='arc branch --merged | command grep -vE "^(\+|\*|\s*(trunk)\s*$)"'
alias arcbda='arc branch --merged | command grep -vE "^(\+|\*|\s*(trunk)\s*$)" | command xargs -n 1 arc branch -d'
alias arcbD='arc branch -D'
alias arcbl='arc blame -b -w'
alias arcbnm='arc branch --no-merged'
alias arcbr='arc branch --remote'
alias arcbs='arc bisect'
alias arcbsb='arc bisect bad'
alias arcbsg='arc bisect good'
alias arcbsr='arc bisect reset'
alias arcbss='arc bisect start'

alias arcc='arc commit -v'
alias arcc!='arc commit -v --amend'
alias arccn!='arc commit -v --no-edit --amend'
alias arcca='arc commit -v -a'
alias arcca!='arc commit -v -a --amend'
alias arccan!='arc commit -v -a --no-edit --amend'
alias arccans!='arc commit -v -a -s --no-edit --amend'
alias arccam='arc commit -a -m'
alias arccsm='arc commit -s -m'
alias arccb='arc checkout -b'
alias arccf='arc config --list'
alias arccl='arc clone --recurse-submodules'
alias arcclean='arc clean -id'
alias arcpristine='arc reset --hard && arc clean -dffx'
alias arccm='arc checkout trunk'
alias arcct='arc checkout trunk'
alias arccmsg='arc commit -m'
alias arcco='arc checkout'
alias arccount='arc shortlog -sn'
alias arccp='arc cherry-pick'
alias arccpa='arc cherry-pick --abort'
alias arccpc='arc cherry-pick --continue'
alias arccs='arc commit -S'

alias arcd='arc diff'
alias arcdca='arc diff --cached'
alias arcdcw='arc diff --cached --word-diff'
alias arcdct='arc describe --tags $(arc rev-list --tags --max-count=1)'
alias arcds='arc diff --staged'
alias arcdt='arc diff-tree --no-commit-id --name-only -r'
alias arcdw='arc diff --word-diff'

function adv() { arc diff -w "$@" | view - }
compdef _arc adv=arc-diff

alias arcf='arc fetch'
alias arcfa='arc fetch --all --prune'
alias arcfo='arc fetch origin'

alias arcfg='arc ls-files | grep'

alias arcg='arc gui citool'
alias arcga='arc gui citool --amend'

function arcgf() {
  [[ "$#" != 1 ]] && local b="$(arc_current_branch)"
  arc push --force origin "${b:=$1}"
}
compdef _arc arcgf=arc-checkout
function arcgfl() {
  [[ "$#" != 1 ]] && local b="$(arc_current_branch)"
  arc push --force-with-lease origin "${b:=$1}"
}
compdef _arc arcgfl=arc-checkout

function arcgl() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    arc pull origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(arc_current_branch)"
    arc pull origin "${b:=$1}"
  fi
}
compdef _arc arcgl=arc-checkout

function arcgp() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    arc push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(arc_current_branch)"
    arc push origin "${b:=$1}"
  fi
}
compdef _arc arcgp=arc-checkout

function arcgpnp() {
  if [[ "$#" == 0 ]]; then
    agl && agp
  else
    agl "${*}" && agp "${*}"
  fi
}
compdef _arc arcgpnp=arc-checkout

function arcgu() {
  [[ "$#" != 1 ]] && local b="$(arc_current_branch)"
  arc pull --rebase origin "${b:=$1}"
}
compdef _arc arcgu=arc-checkout

alias arcgpur='arcgu'
alias arcgpull='arc pull origin "$(arc_current_branch)"'
alias arcgpush='arc push origin "$(arc_current_branch)"'

alias arcgsup='arc branch --set-upstream-to=origin/$(arc_current_branch)'
alias arcpsup='arc push --set-upstream origin $(arc_current_branch)'

alias archh='arc help'

alias arcignore='arc update-index --assume-unchanged'
alias arcignored='arc ls-files -v | grep "^[[:lower:]]"'
alias arc-svn-dcommit-push='arc svn dcommit && arc push archub master:svntrunk'

alias arck='\arck --all --branches'
alias arcke='\arck --all $(arc log -g --pretty=%h)'

alias arcl='arc pull'
alias arclg='arc log --stat'
alias arclgp='arc log --stat -p'
alias arclgg='arc log --graph'
alias arclgga='arc log --graph --decorate --all'
alias arclgm='arc log --graph --max-count=10'
alias arclo='arc log --oneline --decorate'
alias arclol="arc log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias arclols="arc log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias arclod="arc log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias arclods="arc log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias arclola="arc log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias arclog='arc log --oneline --decorate --graph'
alias arcloga='arc log --oneline --decorate --graph --all'
alias arclp="_arc_log_prettily"

alias arcm='arc merge'
alias arcmom='arc merge origin/master'
alias arcmt='arc mergetool --no-prompt'
alias arcmtvim='arc mergetool --no-prompt --tool=vimdiff'
alias arcmum='arc merge upstream/master'
alias arcma='arc merge --abort'

alias arcp='arc push'
alias arcpd='arc push --dry-run'
alias arcpf='arc push --force-with-lease'
alias arcpf!='arc push --force'
alias arcpoat='arc push origin --all && arc push origin --tags'
alias arcpu='arc push upstream'
alias arcpv='arc push -v'

alias arcr='arc remote'
alias arcra='arc remote add'
alias arcrb='arc rebase'
alias arcrba='arc rebase --abort'
alias arcrbc='arc rebase --continue'
alias arcrbd='arc rebase develop'
alias arcrbi='arc rebase -i'
alias arcrbm='arc rebase master'
alias arcrbs='arc rebase --skip'
alias arcrev='arc revert'
alias arcrh='arc reset'
alias arcrhh='arc reset --hard'
alias arcroh='arc reset origin/$(arc_current_branch) --hard'
alias arcrm='arc rm'
alias arcrmc='arc rm --cached'
alias arcrmv='arc remote rename'
alias arcrrm='arc remote remove'
alias arcrs='arc restore'
alias arcrset='arc remote set-url'
alias arcrss='arc restore --source'
alias arcrt='cd "$(arc rev-parse --show-toplevel || echo .)"'
alias arcru='arc reset --'
alias arcrup='arc remote update'
alias arcrv='arc remote -v'

alias arcsb='arc status -sb'
alias arcsd='arc svn dcommit'
alias arcsh='arc show'
alias arcsi='arc submodule init'
alias arcsps='arc show --pretty=short --show-signature'
alias arcsr='arc svn rebase'
alias arcss='arc status -s'
alias arcst='arc status'


# use the default stash push on arc 2.13 and newer
autoload -Uz is-at-least
is-at-least 2.13 "$(arc --version 2>/dev/null | awk '{print $3}')" \
  && alias arcsta='arc stash push' \
  || alias arcsta='arc stash save'

alias arcstaa='arc stash apply'
alias arcstc='arc stash clear'
alias arcstd='arc stash drop'
alias arcstl='arc stash list'
alias arcstp='arc stash pop'
alias arcsts='arc stash show --text'
alias arcstu='arc stash --include-untracked'
alias arcstall='arc stash --all'
alias arcsu='arc submodule update'
alias arcsw='arc switch'
alias arcswc='arc switch -c'

alias arcts='arc tag -s'
alias arctv='arc tag | sort -V'
alias arctl='gtl(){ arc tag --sort=-v:refname -n -l "${1}*" }; noglob gtl'

alias arcunignore='arc update-index --no-assume-unchanged'
alias arcunwip='arc log -n 1 | grep -q -c "\-\-wip\-\-" && arc reset HEAD~1'
alias arcup='arc pull --rebase'
alias arcupv='arc pull --rebase -v'
alias arcupa='arc pull --rebase --autostash'
alias arcupav='arc pull --rebase --autostash -v'
alias arclum='arc pull upstream master'

alias arcwch='arc whatchanged -p --abbrev-commit --pretty=medium'
alias arcwip='arc add -A; arc rm $(arc ls-files --deleted) 2> /dev/null; arc commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'

function arcrename() {
  if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: $0 old_branch new_branch"
    return 1
  fi

  # Rename branch locally
  arc branch -m "$1" "$2"
  # Rename branch in origin remote
  if arc push origin :"$1"; then
    arc push --set-upstream origin "$2"
  fi
}
