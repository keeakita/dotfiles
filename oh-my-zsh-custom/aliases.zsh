# Because I like vim
alias :q="exit"

# Default flags
alias tmux="tmux -2"
alias ls="ls --color=auto -h --group-directories-first"
alias la="ls -A --color=auto -h --group-directories-first"
alias ll="ls -lA --color=auto -h --group-directories-first"
alias du="du -h"
alias df="df -h"

# common mistakes
alias vp='cp'
alias grpe='grep'

# git
alias gitroot='cd "$(git rev-parse --show-toplevel)"'
alias groot='echo "I am Groot."; cd "$(git rev-parse --show-toplevel)"'

# Prevent accidental scp local copies
alias scp='scp-better'

# Make a note with today's date
alias mknote="vim $(date --iso-8601).markdown"

# Alias vim to neovim
if command -v nvim > /dev/null ; then
    alias vim="nvim"
    alias vimdiff="nvim -d"
fi
