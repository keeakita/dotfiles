# cd into directory just by directory name
setopt autocd

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
stty -ixon

# Do not kill background processes when closing the shell. 
setopt nohup

# Do not warn about closing the shell with background jobs running.
setopt nocheckjobs

# don't record repeated things in history
setopt histignoredups

# allows comments in commands
setopt interactivecomments

