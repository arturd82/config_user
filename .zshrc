#~/.zshrc
# chsh -s /bin/zsh user
# autocompletion for ArchLinux:
# zsh-yaourt, zsh-packer from AUR
#
#Autocomplete
# Настройки цветов #####################################################
#Color table from: http://www.understudy.net/custom.html
# Set up the prompt
fg_white=%{$'\e[1;37m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_lred=%{$'\e[1;31m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_purple=%{$'\e[0;35m'%}
fg_blue=%{$'\e[0;34m'%}
fg_brown=%{$'\e[0;33m'%}
fg_green=%{$'\e[0;32m'%}
fg_red=%{$'\e[0;31m'%}
fg_black=%{$'\e[0;30m'%}

#Attributes
at_strikeoff=%{$'\e[29m'%}
at_reverseoff=%{$'\e[27m'%}
at_blinkoff=%{$'\e[25m'%}
at_underloff=%{$'\e[24m'%}
at_italicsoff=%{$'\e[23m'%}
at_boldoff=%{$'\e[22m'%}
at_strike=%{$'\e[9m'%}
at_nondisp=%{$'\e[8m'%}
at_reverse=%{$'\e[7m'%}
at_outline=%{$'\e[6m'%}
at_blink=%{$'\e[5m'%}
at_underl=%{$'\e[4m'%}
at_italics=%{$'\e[3m'%}
at_bold=%{$'\e[1m'%}
at_normal=%{$'\e[0m'%}

#Text Background Colors
bg_gray=%{$'\e[0;47m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_purple=%{$'\e[0;45m'%}
bg_blue=%{$'\e[0;44m'%}
bg_brown=%{$'\e[0;43m'%}
bg_green=%{$'\e[0;42m'%}
bg_red=%{$'\e[0;41m'%}

# Разукрашивание ошибок
alias -g ERR='2>>( sed -ue "s/.*/$fg_bold[red]&$reset_color/" 1>&2 )'

if [ -x /usr/bin/dircolors ]; then
  #test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dirc$
  alias ls='ls --color=auto -F'
  alias dir='dir --color=auto -F'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Разукрашиваем некоторые команды с помощью grc
[[ -f /usr/bin/grc ]] && {
  alias ping="grc --colour=auto ping"
  alias traceroute="grc --colour=auto traceroute"
  alias make="grc --colour=auto make"
  alias diff="grc --colour=auto diff"
  alias cvs="grc --colour=auto cvs"
  alias netstat="grc --colour=auto netstat"
}


autoload -U compinit promptinit
compinit
promptinit
[[ -a $(whence -p pacman-color) ]] && compdef _pacman pacman-color=pacman
setopt CORRECT_ALL
SPROMPT="Ошибка! ввести %r вместо %R? ([Y]es/[N]o/[E]dit/[A]bort) "
setopt autocd
autoload -U incremental-complete-word
zle -N incremental-complete-word
autoload -U insert-files
zle -N insert-files
autoload -U predict-on
zle -N predict-on
zmodload zsh/complist
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# autocomplit
zstyle ':completion:*:*:(^rm):*:*files' ignored-pacodeerns '*?.o' '*?.c~' \
'*?.old' '*?.pro'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Приглашение интерпретатора команд ####################################

if [ $UID -eq 0 ]; then
PROMPT="
${fg_lred}%n${fg_lblue}@${at_underl}%m${at_underloff}${fg_white}[${fg_cyan}%~${fg_white}]
[${fg_green}%T${fg_white}] # ${at_normal}"
    else
PROMPT="
${fg_lblue}%n@${at_underl}%m${at_underloff}${fg_white}[${fg_cyan}%~${fg_white}]
[${fg_green}%T${fg_white}] %# ${at_normal}"
fi
########################################################################




# Colorize red for root, green for normal users
#if [[ "$USER" == "root" ]]; then
#  COLOR="%{[0m[01;31m%}"
#else
#  COLOR="%{[0m[01;32m%}"
#fi
#RPROMPT=$'%{\e[1;34m%}%T%{\e[0m%}'
# prompt (if running screen, show window #)
#if [ x$WINDOW != x ]; then
#    export PS1="$COLOR$WINDOW:%{[01;34m%}%~ $COLOR%#%{[0m%} "
#else
#    export PS1="%{[01;34m%}%~ $COLOR%#%{[0m%} "
#fi

# If we're using a dumb terminal (ie. emacs), assume we don't want colour.
#if [[ "$TERM" == "dumb" ]]; then
#        export PS1="%~ %# "
#fi

# Атрибуты доступа для новых файлов
umask 022
# Отключение звукового сигнала
setopt  No_Beep

# Сочетание клавиш в стиле vi
#set -o vi
#bindkey -v
# Сочетание клавиш в стиле emacs
bindkey -e
# Стандартные сочетания клавиш emacs
#Ctrl+a     в начало строки
#Ctrl+e     в конец строки
#Ctrl+b     на символ назад
#Ctrl+c     завершить
#Ctrl+f     на символ вперед
#Ctrl+k     удалить до конца строки
#Ctrl+u     удалить все символы слева от курсора до начала строки
#Сtrl+w     удалить символы слева от курсора до начала слова
#Ctrl+t     меняет символ под курсором на предыдущий
#Ctrl+Shift+- отмена
#ALt+l      привести к нижнему регистру
#Alt+u      привести к верхнему регистру
#Alt+C      первая буква заглавная
#Ctrl+l     clear
#Ctrl+p     previous
#Ctrl+n     next
bindkey '\e[3~' delete-char # del
bindkey ';5D' backward-word # ctrl+left
bindkey ';5C' forward-word #ctrl+right

# Export
export EDITOR="/usr/bin/vim"
export TERM=xterm-256color
export PATH="$PATH:/home/$USER/bin"
#
# Aliases
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias grep='grep --colour=auto'
alias sudo='A=`alias` sudo '
#alias pacman='sudo pacman-color'
#alias sc='sudo systemctl'
alias nc='sudo netcfg'
alias -s {avi,mpeg,mpg,mov,m2v}=mplayer
alias -s {odt,doc,sxw,rtf}=openoffice.org
alias -s {ogg,mp3,wav,wma}=cmus
autoload -U pick-web-browser
alias -s {html,htm}=chromium
alias -s sh=sh
alias -s py=python

#  History
export HISTFILE=~/.zsh_history
export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# zsh-syntax-highlighting from AUR
source /usr/share/zsh/plugins/zsh-syntax-highlight/zsh-syntax-highlighting.zsh

# Распаковка архивов
# example: extract file
extract () {
 if [ -f $1 ] ; then
 case $1 in
 *.tar.bz2)   tar xjf $1        ;;
 *.tar.gz)    tar xzf $1     ;;
 *.bz2)       bunzip2 $1       ;;
 *.rar)       unrar x $1     ;;
 *.gz)        gunzip $1     ;;
 *.tar)       tar xf $1        ;;
 *.tbz2)      tar xjf $1      ;;
 *.tbz)       tar -xjvf $1    ;;
 *.tgz)       tar xzf $1       ;;
 *.zip)       unzip $1     ;;
 *.Z)         uncompress $1  ;;
 *.7z)        7z x $1    ;;
 *)           echo "I don't know how to extract '$1'..." ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
}

# Запаковать архив
# example: pk tar file
pk () {
 if [ $1 ] ; then
 case $1 in
 tbz)       tar cjvf $2.tar.bz2 $2      ;;
 tgz)       tar czvf $2.tar.gz  $2       ;;
 tar)      tar cpvf $2.tar  $2       ;;
 bz2)    bzip $2 ;;
 gz)        gzip -c -9 -n $2 > $2.gz ;;
 zip)       zip -r $2.zip $2   ;;
 7z)        7z a $2.7z $2    ;;
 *)         echo "'$1' cannot be packed via pk()" ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
}
alias clean="/bin/bash /root/ubuntu-cleaner.sh"
alias ping="grc ping"
alias traceroute="grc traceroute"
alias si="sudo -i"
alias upgrade="aptitude update;aptitude -y safe-upgrade;aptitude clean;aptitude purge"
alias xrestart="sudo service lightdm restart"
alias mikrotik="ssh admin@192.168.99.5"
alias debian="ssh root@192.168.99.20"
alias servak="ssh root@192.168.99.21"
alias centos="ssh root@192.168.99.22"
alias bsd="ssh root@192.168.99.23"
alias CentOS="ssh root@192.168.99.24"
alias mac="ssh root@192.168.99.107"
alias proxmox="ssh root@192.168.99.159"
alias clean="/bin/bash /root/ubuntu-cleaner.sh"
alias centos-h='VBoxHeadless -s "CentOS 6" -v off &'
alias debian-h="VBoxHeadless -s "Debian" -v off &"
alias mikrotik-h="VBoxHeadless -s "Mikrotik" -v off &"
alias servak-h='VBoxHeadless -s "Ubuntu-Server" -v off &'
alias bsd-h="VBoxHeadless -s "FreeBSD" -v off &"
alias save-debian='VBoxManage controlvm "Debian" savestate'
alias save-mikrotik='VBoxManage controlvm "Mikrotik" savestate'
alias save-centos='VBoxManage controlvm "CentOS 6" savestate'
alias save-servak='VBoxManage controlvm "Ubuntu-Server" savestate'
alias save-bsd='VBoxManage controlvm "FreeBSD" savestate'
alias poweroff-3="ssh root@192.168.99.107 poweroff&&ssh root@192.168.99.159 poweroff&&poweroff"
alias poweroff-2="ssh root@192.168.99.107 poweroff&&poweroff"
alias ping="grc ping"
alias traceroute="grc traceroute"
alias netstat="grc netstat"
alias log-out="pkill -KILL -u sysadmin"
alias lenovo="wakeonlan d4:3d:7e:41:e6:53"
archey
export LESS_TERMCAP_mb=$'\E[01;33m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;42;30m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'
export PATH=/usr/games:$PATH
#if [ "$TMUX" = "" ]; then tmux a; fi
#[[ -z "$TMUX" ]] && exec tmux a
