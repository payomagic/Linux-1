# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

export EDITOR='nano'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

#if [ "$PS1" != "" ]; then
#export PS1="[%d %t %n@%m]%~%#"
#export PS1="[%n@%m][%t]%~%# "
#fi

#monitor first to find out correct output!
#bindkey -s '@' '|'           #map with shift first key to second key
#bind -s '£' '#'           #map with shift first key to second key
#bind '^A'      beginning-of-line       # Home
#bind '^E'      end-of-line             # End
#bind '\e[1~'      beginning-of-line       # Home
#bind '\e[4~'      end-of-line             # End
#bind '^D'      delete-char             # Del
#bindkey '\e['   delete-char             # Del
#bind '\eOC' forward-word            # C-Right
#bind '\eOD' backward-word           # C-Left
#bind '\e.'     insert-last-word        # Esc+. works now in screen/tmux
#bindkey '\e[2~'   overwrite-mode          # Insert
#bindkey '\e[5~'   history-search-backward # PgUp
#bindkey '\e[6~'   history-search-forward  # PgDn
#bindkey "^[OD" backward-word
#bindkey "^[OC" forward-word

# Colorz!!
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

##################
if [ -f ~/.bash_completion-docker ]; then
    . ~/.bash_completion-docker
fi
#################

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

#.#
#alias guibootplz='sudo systemctl set-default graphical.target'
#.#
#alias ip2hex='printf "%02x%02x%02x%02x\n" 10 0 2 217'
#.#
#alias mssping='ping -Mdo -c3 -s1452 1.1.1.1'
#.#
#.#
# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

### SSH aliases ###
alias SS1='ssh -p 5622 -l administrator -X 172.20.0.2'
alias SS2='ssh -p 5622 -l administrator -X 172.21.0.1'
alias wedos2-tunnel='echo "connect to localhost port 2222" && ssh -R 2222:localhost:22 -p 5622 administrator@31.31.75.17'

#export BASH_IT="/home/administrator/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
#export BASH_IT_THEME='parrot'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
#export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
#export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
#export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
#source "$BASH_IT"/bash_it.sh

### FUNCTIONS

# # mkcd = create a directory and `cd` into it
function mkcd() {
mkdir -p "$@" && cd "$_";
}

function tunnel() {
        echo "ssh -L 9909:192.168.1.1:80 home"
        echo "# Connections to tcp localhost:9909 will be made to 192.168.1.1:80 via SSH tunnel to home"
}

function cwd() {
        echo "${PWD##*/}"
}

function lowercase() {
        echo $@ | tr '[:upper:]' '[:lower:]'
}
alias lower='lowercase'
alias lcase='lowercase'

function uppercase() {
        echo $@ | tr '[:lower:]' '[:upper:]'
}
alias upper='uppercase'
alias ucase='uppercase'

#.#
alias diff='colordiff'
#.#
alias whileloop='echo "while true; do sleep 2 && echo \"GO\!\" && dosomething; done"'
#.#
alias bigdirs='du --max-depth=1 2> /dev/null | sort -n -r | head -n20'

######################
function fuck() {
        if killall -9 "$2"; then
                echo ; echo " (???????$(echo "$2"|toilet -f term -F rotate)"; echo
        fi
}

### BS FUNCTIONS
function snow() {
        clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH*\033[0;0H",a[x],x;}}'
}
function happydance() {
        echo ";D=-<\n"
        echo ";D|-<\n"
        echo ";D\-<\n"
        echo ";D|-<\n"
        echo ";D/-<\n"
        echo ";D|-<\n"
}
function disco() {
        echo "(?_?)"
        echo "<)   )?"
        echo " /    \ "
        echo ""
        echo "\(?_?)"
        echo " (   (>"
        echo " /    \ "
        echo ""
        echo " (?_?)"
        echo "<)   )>"
        echo " /    \ "
}
function fliptable() { echo "??????? ???"; } # Flip a table. Example usage: fsck -y /dev/sdb1 || fliptable
function monocle() { echo "?_??\n"; }
function csiyeah() { echo "(?_?) , ( ?_?)>??-? , (??_?)"; }
function csiyeah-ani() {
  echo -en "(?_?)      \r"; sleep .4
  echo -en "( ?_?)>??-?\r"; sleep .4
  echo     "(??_?)       "; sleep .4
}
function shrug() { echo "?\_(?)_/?"; }
function rageflip() {
        echo;
        echo -n "( ?_??  ???   \r"; sleep .4;
        echo -n " ( ?_?? ???   \r"; sleep .4;
        echo -n "  ( ???????   \r"; sleep .4;
        echo -n "  (?'?'????   \r"; sleep .3;
        echo -n "  (?'?'??? ?  \r"; sleep .3;
        echo -n "  (??????? ???  "; sleep .3;
}
function flip() {       # courtesy of Savant
  echo;
  echo -en "( ?_??  ???   \r"; sleep .2;
  echo -en " ( ?_?? ???   \r"; sleep .2;
  echo -en "  ( ???????   \r"; sleep .2;
  echo -en "  (?'?'????   \r"; sleep .1;
  echo -en "  (?'?'??? ?  \r"; sleep .1;
  echo     "  (??????? ???"; sleep .1;
  return 0
}
function annoyknybel() {
        dd if=/dev/urandom bs=7 count=100 | base64 | say -v "Trinoids"
}
function status() {
        echo "http://imgs.xkcd.com/comics/success.png"
}
function fixit() {
        echo "https://www.youtube.com/watch?v=1Isjgc0oX0s"
}
function backup_filez(){
        cd /media/administrator/
        ls -lahrnts
        echo 'to backup issue cmd:: rsync -progress -avz -e " ssh -p 5622" ~/.bash* administrator@10.11.10.8:/media/administrator/500v2/ryzen'
}

man() {
        env \
                LESS_TERMCAP_md=$(printf "\e[1;36m") \
                LESS_TERMCAP_me=$(printf "\e[0m") \
                LESS_TERMCAP_se=$(printf "\e[0m") \
                LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
                LESS_TERMCAP_ue=$(printf "\e[0m") \
                LESS_TERMCAP_us=$(printf "\e[1;32m") \
                man "$@"
}

bkp2ryzen() {
rsync -e "ssh -p5622 " \
-aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} \
/  10.11.10.8:/media/administrator/500v2/wedos
}

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }


