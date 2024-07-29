# History
export HISTFILE="$HOME"/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000

# Force vim to use nvim paths.
# See also the top of ~/config/nvim/init.vim
export VIMINIT="source ~/.config/nvim/init.vim"

# Set the default text editor.
if command -v nvim > /dev/null ; then
    export EDITOR="nvim"
    export VISUAL="nvim"
else
    export EDITOR="vim"
    export VISUAL="vim"
fi

export BROWSER="firefox"

if [ -e "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

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

# NVM
if [ -e "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

# rust
if [ -e "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
