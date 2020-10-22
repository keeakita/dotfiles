# Prepend "sudo" to the command line if it is not already there.
prepend-sudo() {
	if ! echo "$BUFFER" | grep -q "^sudo "
	then
		BUFFER="sudo $BUFFER"
		CURSOR+=5
	fi
}
zle -N prepend-sudo

# Prepend "vim" to the command line if it is not already there.
prepend-vim() {
	if ! echo "$BUFFER" | grep -q "^vim "
	then
		BUFFER="vim $BUFFER"
		CURSOR+=5
	fi
}
zle -N prepend-vim

# contains(string, substring)
#
# Returns 0 if the specified string contains the specified substring,
# otherwise returns 1.
# Taken from https://stackoverflow.com/questions/2829613/how-do-you-tell-if-a-string-contains-another-string-in-unix-shell-scripting/8811800#8811800
contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}

# Prevents accidental scp-ing to a local file named "user@host" because you
# forgot the trailing ':'.
scp-better() {
    for x in $@; do
        if (contains "$x" "@" ) && (! contains "$x" ":"); then
            echo "Did you forget a ':' in that command?";
            echo "Exiting for safety, call scp by its full path to override.";
            return 1;
        fi
    done

    # Find a real scp, in case the user has it aliased
    SCP=`where scp | grep -v alias | head -n1`
    $SCP $@
}
