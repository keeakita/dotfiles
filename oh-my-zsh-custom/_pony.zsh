# Ponies! (or cows)
if [[ $TERM == "xterm-256color" ]]; then
    fortune | ponysay -W 77
else
    fortune | cowsay -W 77
fi
