# Take ownership of file or directory
alias mine="sudo chown -R $(whoami):$(whoami)"

# Vim as root
alias svim="EDITOR=vim sudoedit"

# SSH shortcuts
alias stdlinux='ssh osler@stdlinux.cse.ohio-state.edu -t zsh'
alias stallman='ssh osler@stallman.cse.ohio-state.edu -t zsh'

# Because I like vim
alias :q="exit"

# Default flags
alias tmux="tmux -2"
alias ls="ls --color=auto -h --group-directories-first"
alias la="ls -A --color=auto -h --group-directories-first"
alias ll="ls -lA --color=auto -h --group-directories-first"
alias du="du -h"
alias df="df -h"
alias oggenc="oggenc -q7"

# Productivity
alias ISolemnlySwearImUpToNoGood='switch_hosts block'
alias MischiefManaged='switch_hosts free'

# wat
alias pootis='for i in {1..10}; do echo "POOTIS"; done'
alias stahp='echo $USER; sleep .75; echo "wat r u doing"; sleep .75; echo $USER; sleep .75; echo "stahp"'

# common mistakes
alias vp='cp'
alias grpe='grep'

# git
alias gitroot='cd "$(git rev-parse --show-toplevel)"'
alias groot='echo "I am Groot."; cd "$(git rev-parse --show-toplevel)"'
alias mvnfast='mvn install -DskipTests -DskipDbDeploy';

# Get size files in just this dir
alias dirsize='find ./ -maxdepth 1 -exec du -hs {} \; | sort -hr'

# Prevent accidental scp local copies
alias scp='scp-better'

# Better git diff
alias gd='git-fulldiff'
