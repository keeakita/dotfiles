# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks_custom"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git tmux vi-mode mvn)

# Add stuff based on distro
if [ -f /etc/os-release ] && cat /etc/os-release | grep 'ID=ubuntu' > /dev/null 2>&1; then
    plugins+=(command-not-found debian)
elif command -v pacman > /dev/null 2>&1; then
    plugins+=(archlinux systemd)
elif [ -f /etc/redhat-release ]; then
    plugins+=(yum)
fi

# RVM only if we have it
if command -v rvm > /dev/null 2>&1; then
    plguins+=(gem rails3 rvm)
fi

# Change the custom path for oh-my-zsh to make git management easier
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/lib/qt4/bin:/usr/local/heroku/bin:/home/william/.rvm/gems/ruby-1.9.3-p327/bin:/home/william/.rvm/gems/ruby-1.9.3-p327@global/bin:/home/william/.rvm/rubies/ruby-1.9.3-p327/bin:/home/william/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/android-sdk/platform-tools:/usr/bin/core_perl
