# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# function for including directories
function include_d {
    dir=$1
    if [ -d $HOME/.$dir.d -a -r $HOME/.$dir.d -a -x $HOME/.$dir.d ]; then
	for i in $HOME/.$dir.d/*.sh; do
	    . $i
	done
    fi
}

# add to my path
export PATH=${PATH}:~/scripts

# include functions
include_d bash_functions

# include aliases
include_d bash_aliases

# include completions
include_d bash_completion

