# Executed when bash is run as an interactive shell

# Enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix
then
    # Ubuntu
    . /etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ] && ! shopt -oq posix
then
    # Arch Linux
    . /usr/share/bash-completion/bash_completion
fi

if [ -f /usr/share/git/git-prompt.sh ]
then
    . /usr/share/git/git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"

# Compose the prompt
function prompt_command() {
    local status=$?

    local reset='\[\e[0m\]'

    local black='\[\e[0;30m\]'
    local red='\[\e[0;31m\]'
    local green='\[\e[0;32m\]'
    local yellow='\[\e[0;33m\]'
    local blue='\[\e[0;34m\]'
    local magenta='\[\e[0;35m\]'
    local cyan='\[\e[0;36m\]'
    local white='\[\e[0;37m\]'

    local b_black='\[\e[1;30m\]'
    local b_red='\[\e[1;31m\]'
    local b_green='\[\e[1;32m\]'
    local b_yellow='\[\e[1;33m\]'
    local b_blue='\[\e[1;34m\]'
    local b_magenta='\[\e[1;35m\]'
    local b_cyan='\[\e[1;36m\]'
    local b_white='\[\e[1;37m\]'

    PS1=""

    if [ $status != 0 ]; then
        PS1+="${b_red}${status}${reset} "
    fi
    PS1+="${b_blue}\u${reset}@${b_blue}\H${reset} ${cyan}\w${reset}"
    if [ "x$VIRTUAL_ENV" != x ]; then
        local envname=$(basename "$VIRTUAL_ENV")
        PS1+=" ${yellow}${envname}${reset}"
    fi
    local gitbranch=$(declare -F __git_ps1 &>/dev/null && __git_ps1 "%s")
    if [ "x$gitbranch" != x ]; then
        PS1+=" ${magenta}${gitbranch}${reset}"
    fi
    PS1+="\n$b_white\$ $reset"
}

PROMPT_COMMAND=prompt_command

export VISUAL=vim
export EDITOR=$VISUAL

export MAKEFLAGS=-j8

# No duplicates and lines with leading space in history
HISTCONTROL=ignoreboth
# Append to the history file, don't override
shopt -s histappend
# Control history size
HISTSIZE=100
HISTFILESIZE=2000

# Check window size after each command
shopt -s checkwinsize

# Enable color support of ls
if [ -r "$HOME/.dir_colors" ]; then
    eval `dircolors -b $HOME/.dir_colors`
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias l='ls -lA'

alias view='vim -R'
