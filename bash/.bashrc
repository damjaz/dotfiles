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
set -o noclobber
# An interactive shell will not exit upon reading EOF.
set -o ignoreeof
# Disable '!' style history substitution.
#set +o histexpand




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




# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# Time stamps are written to the history file so they may be pre‐served across shell sessions.
HISTTIMEFORMAT='[%d-%m-%y %H:%M:%S] '
# The number of commands to remember in the command history.
HISTSIZE=100000
# The maximum number of lines contained in the history file.
HISTFILESIZE=100000
# Minimalist prompt
PS1='[\w] '
(( ! $EUID )) && PS1='#[\w] '

# set PATH so it includes some bin dirs if they doesn't exist in PATH yet
newpathdirs=("/sbin" "/usr/sbin" "$HOME/bin")
pathdirs=(${PATH//:/ })
for newpathdir in "${newpathdirs[@]}"; do
  newpathdirexist=0
  for pathdir in "${pathdirs[@]}"; do
    if [[ "$newpathdir" = "$pathdir" ]]; then
      newpathdirexist=1
      break
    fi
  done
  if [[ $newpathdirexist -eq 0 ]]; then
    if [[ -d "$newpathdir" ]]; then
      PATH="$newpathdir:$PATH"
    fi
  fi
done

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export BROWSER='chromium'
export PATH

alias ls='ls -hX --color=auto --group-directories-first'
alias lt='ls -t'
alias ll='ls -l'
alias la='ls -A'
alias lla='ll -A'
alias lls='lla -S'

alias ..='cd ..'
alias ...='cd ../..'

alias mkdir='mkdir -p -v'

alias debug="set -o nounset; set -o xtrace"
alias path='echo -e ${PATH//:/\\n}'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

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

# start X automatically after login on tty1
[[ $(tty) = '/dev/tty1' ]] && exec startx
