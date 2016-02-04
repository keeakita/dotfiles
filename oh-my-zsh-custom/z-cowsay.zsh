if command -v cowsay  > /dev/null 2>&1 ; then
    # Attempt to use wolf.cow if present
    if echo "" | cowsay -f wolf > /dev/null 2>&1 ; then
        fortune | cowsay -f wolf -n
    else
        # Fallback to default cow
        fortune | cowsay -n
    fi
fi
