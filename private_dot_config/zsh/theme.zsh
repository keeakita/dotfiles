ZSH_THEME_GIT_PROMPT_DIRTY='*'
source "$ZDOTDIR"/thirdparty/git.zsh
source "$ZDOTDIR"/thirdparty/agnoster.zsh-theme

setopt prompt_subst
export SEGMENT_SEPARATOR=''
export PS1='%{%f%b%k%}$(build_prompt)
 🐺 '
export PS2=" 🕴 "
