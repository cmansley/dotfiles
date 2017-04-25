# Mercurial function for fancy prompts
hg_ps1() {
    hg prompt --angle-brackets "[<<branch|quiet>:><rev>]<update>" 2> /dev/null
}

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

GIT_PS1_SHOWDIRTYSTATE=yes
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[1;31m\]$(__git_ps1 "[%s]")\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1 "[%s]")\$ '
fi
unset color_prompt force_color_prompt

# Function to log history across all terminals
log_bash_persistent_history() {
  local command_part="$(fc -ln -0)"
  if [ "$command_part" != "$PERSISTENT_HISTORY_LAST" ]
  then
    echo "$command_part" >> ~/.persistent_history
    export PERSISTENT_HISTORY_LAST="$command_part"
  fi
}

# Force history on prompt command
PROMPT_COMMAND="log_bash_persistent_history"
