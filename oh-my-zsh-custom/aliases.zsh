# Take ownership of file or directory
alias mine="sudo chown -R $(whoami):$(whoami)"

# Vim as root
alias svim="EDITOR=vim sudoedit"

# SSH shortcuts
alias stdlinux='ssh osler@stdlinux.cse.ohio-state.edu -t zsh'
alias stallman='ssh osler@stallman.cse.ohio-state.edu -t zsh'
alias idle2='ssh william@oslers.us -t "tmux attach-session -t weechat || tmux new-session -s weechat weechat-curses"'

# Because I like vim
alias :q="exit"

# Default flags
alias tmux="tmux -2"
alias ls="ls --color=auto -h --group-directories-first"
alias la="ls -A --color=auto -h --group-directories-first"
alias ll="ls -lA --color=auto -h --group-directories-first"
alias du="du -hs"
alias df="df -h"

# Productivity
alias ISolemnlySwearImUpToNoGood='switch_hosts block'
alias MischiefManaged='switch_hosts free'

# wat
alias pootis='for i in {1..10}; do echo "POOTIS"; done'
alias stahp='echo $USER; sleep .75; echo "wat r u doing"; sleep .75; echo $USER; sleep .75; echo "stahp"'

# common mistakes
alias vp='cp'
