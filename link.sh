#!/bin/bash
# Backs up old dotfiles and symlinks all the new ones

set -u

BACKUPDIR="$HOME"/dotfile_backups # Don't end this with a /

cd "$HOME"

# Make the backup dir if it doesn't exist
if [ ! -d "$BACKUPDIR" ]; then
    mkdir -p "$BACKUPDIR"
fi

for f in "$HOME"/dotfiles/*; do
    if ! echo "$f" | grep -q "$HOME"/dotfiles/README.md && ! echo "$f" | grep -q "$HOME"/dotfiles/link.sh; then
        # We use \0 since it's the only invalid filename character on ext4
        BASENAME=$(echo "$f" | sed -e s\0"$HOME"/dotfiles/\0\0;) 
        ORIGFILE="$HOME"/."$BASENAME"
        BACKUPFILE="$BACKUPDIR"/."$BASENAME"

        if [ ! -L "$ORIGFILE" ]; then
            mv "$ORIGFILE" "$BACKUPFILE"
        fi

        # Now we symlink
        ln -s -T "$f" "$ORIGFILE"
    fi
done

# Set up a symlink for neovim
mkdir -p ~/.config
ln -s -T ~/.vim ~/.config/nvim
ln -s -T ~/.vimrc ~/.config/nvim/init.vim
