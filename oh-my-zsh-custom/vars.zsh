# "/bin/zsh" should be the value of $SHELL if this config is parsed. This line
# should not be necessary, but it's not a bad idea to have just in case.
export SHELL="/bin/zsh"

# Set the default text editor.
export EDITOR="vim"
export VISUAL="vim"

export BROWSER="firefox"

# If in a terminal that can use 256 colors, ensure TERM reflects that fact.
if [ "$TERM" = "xterm" ]
then
    export TERM="xterm-256color"
elif [ "$TERM" = "screen" ]
then
    export TERM="screen-256color"
fi

# set PDF reader
export PDFREADER="okular"
export PDFVIEWER="okular"

# Set the default image viewer.
export IMAGEVIEWER="gwenview"

export TZ="America/New_York"

# rbenv
if [ -e "$HOME/.rbenv/bin" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# hub
if command -v hub > /dev/null ; then
    eval "$(hub alias -s)"
fi

# Base16 colors
source ~/.base16-shell/base16-tomorrow.dark.sh
