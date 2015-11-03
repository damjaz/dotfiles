#!/bin/bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return ;;
esac



# Cause the status of terminated background jobs to be reported immediately, 
# rather than before printing the next primary prompt.
set -o notify
# Prevent output redirection using ‘>’, ‘>&’, and ‘<>’ from overwriting existing files. 
#set -o noclobber
# An interactive shell will not exit upon reading EOF.
set -o ignoreeof
# Disable '!' style history substitution.
set +o histexpand



# An argument to the cd builtin command that is not a directory is assumed 
# to be the name of a variable whose value is the directory to change to.
#shopt -s cdable_vars
# Minor errors in the spelling of a directory component in a cd command will be corrected.
shopt -s cdspell
# Bash checks that a command found in the hash table exists before trying to 
# execute it. If a hashed command no longer exists, a normal path search is performed.
shopt -s checkhash
# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# append to the history file, don't overwrite it
shopt -s histappend histreedit histverify
# Bash attempts to save all lines of a multiple-line command in the same 
# history entry. This allows easy re-editing of multi-line commands.
shopt -s cmdhist
# Extended pattern matching features.
shopt -s extglob
# Bash will not attempt to search the PATH for possible completions when 
# completion is attempted on an empty line.
shopt -s no_empty_cmd_completion



# Disable XON/XOFF flow conntrol (C-s/C-q)
stty -ixon
# fancy Ctrl-z, toggles vim/shell, does not work for the rest
#stty susp undef
#bind '"\C-z":"fg\C-m"'


# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# Time stamps are written to the history file so they may be pre‐served across shell sessions.
HISTTIMEFORMAT='[%d-%m-%y %H:%M:%S] '
# The number of commands to remember in the command history.
HISTSIZE=100000
# The maximum number of lines contained in the history file.
HISTFILESIZE=1000000
# simple prompt
PS1='[\w] '
(( ! $EUID )) && PS1='[\w]# '


export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export BROWSER='chromium'
export PATH="$HOME/bin:$PATH"
export LANG=en_US.utf8

alias ls='ls -hX --color=auto --group-directories-first'
alias lt='ls -t'
alias ll='ls -l'
alias la='ls -A'
alias lla='ll -A'
alias lls='lla -S'
alias lex='list_extensions'

alias ..='cd ..'
alias ...='cd ../..'

alias df='df -h'
alias du='du -d 1 -h'

alias mkdir='mkdir -p -v'
alias rmf='rm -rf'
alias sysup='sudo apt-get update && sudo apt-get dist-upgrade'
alias yt2mp3='youtube-dl -x --audio-format mp3 --audio-quality  0 --prefer-ffmpeg'

alias debug="set -o nounset; set -o xtrace"
alias path='echo -e ${PATH//:/\\n}'

alias vibsp='vim ~/.config/bspwm/bspwmrc'
alias visxh='vim ~/.config/sxhkd/sxhkdrc'

alias cdb='cd ~/bin'
alias cdbo='cd ~/documents/books'
alias cdc='cd ~/documents'
alias cdd='cd ~/downloads'
alias cds='cd ~/src'
alias cdi='cd ~/images'

cd() {
  builtin cd -- "$@"
  if [[ $? -eq 0 && $# -gt 0 ]]; then
    ls -t
  fi
}

list_extensions() {
  find . -maxdepth ${1:-1} -type f 2>/dev/null | sed 's/.*\.//' | sort | uniq -c
}

# navigation system
#export MARKPATH="$HOME/.marks"
#
#jump() { 
#    #pushd "$MARKPATH/$1" >&/dev/null || echo "No such mark: $1"
#    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
#}
#
#mark() { 
#    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
#}
#
#unmark() { 
#    rm -i "$MARKPATH/$1"
#}
#
#marks() {
#  for mark in $MARKPATH/*; do
#    local basename="${mark##*/}"
#    local linkdst="$(readlink -f $mark)"
#    linkdst="${linkdst/$HOME/~}"
#    echo "$basename $linkdst"
#  done | column -t
#}
#
#_completemarks() {
#  local curw=${COMP_WORDS[COMP_CWORD]}
#  local wordlist=$(find $MARKPATH -type l -printf "%f\n")
#  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
#  return 0
#}
#
#alias j='jump'
#alias m='mark'
#
#complete -F _completemarks jump j mark m

# git, can be useful in near future
#alias  gs='git status'
#alias  gd='git diff'
#alias gdh='git diff HEAD HEAD~'
#alias gdc='git diff --cached'
#alias gdf='git diff --name-status'
#alias  gh='git show'
#alias gsf='git show --name-status'
#alias  ga='git add'
#alias  gl='git log'
#alias  gf='git fetch'
#alias gl-='git log --follow --'
#alias glf='git log --pretty=medium'
#alias ghh='git show HEAD'
#alias glm='git log --pretty=full --author `git config user.name`'
#alias ghm='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
#alias  gu='git pull'
#alias  gv='git mv'
#alias gli='git update-index --assume-unchanged' # locally ignore changes
#alias glu='git update-index --no-assume-unchanged' # stop ignoring changes
#alias  gc='git commit'
#alias  go='git checkout'
#alias gcp='git cherry-pick'
#alias  gb="git for-each-ref --sort=committerdate refs/heads/ --format='%1B[0;33m%(authordate:short)%1B[0;31m %(refname:short)%1B[m | %(subject)' refs/heads"
#alias gbr='git branch -r'
#alias  gm='git merge'
#alias gmf='git merge --no-ff --no-edit'
#alias gom='git checkout master'
#alias gos='git checkout staging'
#alias gomm='git checkout origin/master -b master'
#alias gmm='git merge master'
#alias grm='git rebase master'
#alias grs='git rebase staging'
#alias  gr='git rebase --preserve-merges'
#alias  gp='git push -u'
#alias  gt='git stash -u'
#alias gta='git stash apply'
#alias gca='git add -A . && git commit --amend --no-edit'
#alias grh='git reset HEAD'
#alias grhh='git reset --hard HEAD'
#alias  gla='git shortlog -ns' # Summary by author
#alias  gbn="git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'" # current branch name
#alias  gra='git rebase --abort'
#alias  grc='git rebase --continue'
#alias  gpr='git branch | cut -c 3- | grep -v master | xargs -L1 git branch -d 2> /dev/null' # Prune already merged local branches
#alias  gwh='git branch -a | grep' # git which: which remote branch matches the regex
#alias grpo='git remote prune origin'


# enable programmable completion
if shopt -q progcomp && [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi

# learn 1 thing from man every time you open the console 
#echo
#man -k $(find /usr/share/man/man[1-8]/ -not -name '*_*' -not -name '*::*' -printf "%f\n" |shuf -n 1|cut -d. -f1) |head -n 1
#echo

# start X automatically after login on tty1
[[ $(tty) = '/dev/tty1' ]] && exec xinit -- -keeptty -nolisten tcp vt01 > ~/.xinit.log 2>&1
