# "/bin/zsh" should be the value of $SHELL if this config is parsed. This line
# should not be necessary, but it's not a bad idea to have just in case.
export SHELL="/bin/zsh"

# Set the default text editor.
if command -v nvim > /dev/null ; then
    export EDITOR="nvim"
    export VISUAL="nvim"
else
    export EDITOR="vim"
    export VISUAL="vim"
fi

export BROWSER="firefox"

# set PDF reader
export PDFREADER="okular"
export PDFVIEWER="okular"

# Set the default image viewer.
export IMAGEVIEWER="gwenview"

export TZ=":/etc/localtime"

# rbenv
if [ -e "$HOME/.rbenv/bin" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# ssh-agent
if command -v ssh-agent > /dev/null ; then
    # Taken from the Arch wiki. Makes sure only one ssh-agent is running
    if ! pgrep -u $USER ssh-agent > /dev/null; then
	ssh-agent > ~/.ssh-agent-thing
    fi
    if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval $(<~/.ssh-agent-thing)
    fi
fi

if [ -e "$HOME/perl5/bin" ]; then
    export PATH="$HOME/perl5/bin:$PATH"
    eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
fi

# NVM
if [ -e "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

export PS2=" 🕴 "

export COWPATH=/usr/share/cows:/usr/local/share/cows

# plenv
if [ -e "$HOME/.plenv/bin" ]; then
    export PATH="$HOME/.plenv/bin:$PATH"
    eval "$(plenv init -)"
fi

# rust
if [ -e "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Increase history size
export HISTSIZE=130000
export SAVEHIST=130000
