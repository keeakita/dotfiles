# Ponies! (or cows)
if [[ $TERM == "xterm-256color" ]] && command -v ponysay > /dev/null 2>&1; then
    fortune | ponysay -W 77
elif command -v cowsay  > /dev/null 2>&1 ; then
    fortune | cowsay -W 77
fi
