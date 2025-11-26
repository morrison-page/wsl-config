# History settings
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

# Check window size after each command
shopt -s checkwinsize

# Custom prompt
PS1='\[\033[00;34m\][\u@\H]\[\033[00m\] \[\033[00;32m\][\w]\[\033[00m\]\n\$ '
PS1="${PS1@L}"

# Default aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -lah --color=auto --group-directories-first'
alias grep='grep --color=auto'

# FZF key bindings and fuzzy completion
if [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
    source /usr/share/fzf/shell/key-bindings.bash
fi

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gl='git log --oneline --graph --decorate'
