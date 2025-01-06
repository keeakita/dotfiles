# cd into directory just by directory name
unsetopt autocd

# prompt to correct typos
setopt correct

# don't propose _shellfunctions when correcting
CORRECT_IGNORE='_*'

# additional glob options
setopt extendedglob

# shut up
setopt nobeep

# don't change nice for bg tasks
setopt nobgnice

# Disable flow control. Specifically, ensure that ctrl-s does not stop
# terminal flow so that it can be used in other programs (such as Vim).
setopt noflowcontrol

# don't record repeated things in history
setopt histignoredups

# allows comments in commands
setopt interactivecomments

# correct only commands, not directories
unsetopt correct_all
setopt correct

# Don't try to autocomplete a home directory
setopt nocdablevars

# If a glob fails, error out
setopt nomatch

# vi editing
bindkey -v
