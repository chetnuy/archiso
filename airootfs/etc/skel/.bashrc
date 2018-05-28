#
# ~/.bashrc
#

# If not running interactively, don't do anything


[[ $- != *i* ]] && return

############# Variables
export PS1='\[\033[01;33m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
HISTFILESIZE=15000 
HISTSIZE=15000
EDITOR=vim
export VISUAL="vim"
BROWSER=/usr/bin/firefox
############# /Variables

############# Aliases
alias ls='ls --color=auto'
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'


alias_completion(){
    # keep global namespace clean
    local cmd completion

    # determine first word of alias definition
    # NOTE: This is really dirty. Is it possible to use
    #       readline's shell-expand-line or alias-expand-line?
    cmd=$(alias "$1" | sed 's/^alias .*='\''//;s/\( .\+\|'\''\)//')

    # determine completion function
    completion=$(complete -p "$1" 2>/dev/null)

    # run _completion_loader only if necessary
    [[ -n $completion ]] || {

        # load completion
        _completion_loader "$cmd"

        # detect completion
        completion=$(complete -p "$cmd" 2>/dev/null)
    }

    # ensure completion was detected
    [[ -n $completion ]] || return 1

    # configure completion
    eval "$(sed "s/$cmd\$/$1/" <<<"$completion")"
}

# set aliases
alias g=git
alias s=sudo

# aliases to load completion for
aliases=(g s)

for a in "${aliases[@]}"; do
    alias_completion "$a"
done

# clean up after ourselves
unset a aliases

