# execute
if [ -f ~/.shenv ]; then
    . ~/.shenv
fi

# exports
export EDITOR="emacsclient"

# bindings
case "$TERM" in
xterm*|rxvt*|eterm*)
        bind '"\ep": previous-history'
        bind '"\en": next-history'
        bind '"\eh": backward-kill-word'
esac

# aliases
alias cb="chromium-browser"

alias em="emacs"
alias emc="emacsclient"

alias ..="cd .."
