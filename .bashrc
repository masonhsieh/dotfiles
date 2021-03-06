#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# for openCV4
#PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig/opencv4.pc
#export PKG_CONFIG_PATH
# for node-opencv4
shopt -s autocd # Allows to cd into directory merely by typing the directory name

PATH="~/bin:$PATH:$HOME/.config/composer/vendor/bin:$HOME/.gem/ruby/2.7.0/bin"
export PYTHONPATH=/usr/lib/python3.9/site-packages
export GPG_TTY=$(tty)
#For arduino IDE
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu/gtk-2.0/modules/
export TERM=rxvt-unicode-256color

# Export cowsay setting for the ansible service:
export ANSIBLE_NOCOWS=1 #disable cowsay on ansible
#export ANSIBLE_COW_SELECTION=random 

#start tmux
#[[ $TERM != "screen" ]] &&  tmux 2>/dev/null 
# If not running interactively, do not do anything
## [[ $- != *i* ]] && return
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
if [ "$TERM" != "linux" ]; then
    source ~/pureline/pureline ~/.pureline.conf
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

# Execute ssh-agent by default
# (ssh-agent -s)
# eval "$(ssh-agent)"
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#
## Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

_pip_completion() {
	COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
	COMP_CWORD=$COMP_CWORD \
	PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip

# Setting 
fortune -o | lolcat
cat << 'EOF' | lolcat
.     .       .  .   . .   .   . .    +  .
  .     .  :     .    .. :. .___---------___.
       .  .   .    .  :.:. _".^ .^ ^.  '.. :"-_. .
    .  :       .  .  .:../:            . .^  :.:\.
        .   . :: +. :.:/: .   .    .        . . .:\
 .  :    .     . _ :::/:               .  ^ .  . .:\
  .. . .   . - : :.:./.                        .  .:\
  .      .     . :..|:                    .  .  ^. .:|
    .       . : : ..||        .                . . !:|
  .     . . . ::. ::\(                           . :)/
 .   .     : . : .:.|. ######              .#######::|
  :.. .  :-  : .:  ::|.#######           ..########:|
 .  .  .  ..  .  .. :\ ########          :######## :/
  .        .+ :: : -.:\ ########       . ########.:/
    .  .+   . . . . :.:\. #######       #######..:/
      :: . . . . ::.:..:.\           .   .   ..:/
   .   .   .  .. :  -::::.\.       | |     . .:/
      .  :  .  .  .-:.":.::.\             ..:/
 .      -.   . . . .: .:::.:.\.           .:/
.   .   .  :      : ....::_:..:\   ___.  :/
   .   .  .   .:. .. .  .: :.:.:\       :/
     +   .   .   : . ::. :.:. .:.|\  .:/|
     .         +   .  .  ...:: ..|  --.:|
.      . . .   .  .  . ... :..:.."(  ..)"
 .   .       .      :  .   .: ::/  .  .::\
EOF

neofetch


# for tmux
function rsc() {
    CLIENTID=$1.`dasource /usr/share/bash-completion/completions/pass
_pass-superadmin(){
    PASSWORD_STORE_DIR=~/.password-store-superadmin _pass
}
complete -o filenames -o nospace -F _password-store-superadmin pass-superadmin
_pass-sysadmin(){
    PASSWORD_STORE_DIR=~/.password-store-sysadmin _pass
}
complete -o filenames -o nospace -F _password-store-sysadmin pass-sysadmin
_pass-web-developer(){
    PASSWORD_STORE_DIR=~/.password-store-web-developer _pass
}
complete -o filenames -o nospace -F _password-store-web-developer pass-web-developer
_pass-accounts(){
    PASSWORD_STORE_DIR=~/.password-store-accounts _pass
}
complete -o filenames -o nospace -F _password-store-accounts pass-accountste +%S`
    tmux new-session -d -t $1 -s $CLIENTID \; set-option destroy-unattached \; attach-session -t $CLIENTID
}

function mksc() {
    tmux new-session -d -s $1
    rsc $1
}

export GTK_IM_MODULE=xim
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=xim
