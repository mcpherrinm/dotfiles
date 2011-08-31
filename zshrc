export LANG="`locale -a | grep -i en_CA\\.utf\.\*8`"
export LC_ALL=$LANG
export LOCALE=$LANG

if [[ -f $HOME/.zshrc_local ]]; then
	source $HOME/.zshrc_local
fi
HISTFILE=~/.histfile
HISTSIZE=1050
SAVEHIST=1000
setopt hist_ignore_all_dups
setopt appendhistory autocd extendedglob
setopt hist_reduce_blanks # remove extra spaces hist commands

unsetopt beep
#vi mode
bindkey -v

zstyle :compinstall filename '$HOME/.zshrc'

#completion
autoload -Uz compinit
zstyle ':completion:*' completer _complete _ignored
compinit

# Colours

autoload -U colors
which dircolors > /dev/null
if [[ $? -eq 0 ]]; then
	eval "$(dircolors -b)"
	if [[ "$terminfo[colors]" -ge 8 ]]; then
		colors
	fi
	alias ls='ls --color=auto'
fi

#pushd
setopt auto_pushd
setopt pushd_silent

setopt auto_list
setopt complete_in_word

export EDITOR=`which vim`

colors
if [ "$UID" = "0" ]; then
	pcolour='red'
else
	pcolour='green'
fi

export PS1="%t %{$fg[$pcolour]%}%2m%b:%{$fg[$pcolour]%}%~%b%# "

#precmd prints before prompting for a command
#preexec runs before exec'ing something
case $TERM in
	*xterm*|rxvt|(dt|k|E)term)
		precmd() { print -Pn "\e]0;%~\a" }
#		preexec() { print -Pn "\e]0;$1 in %~\a" }
	;;
esac

#load aliases
if [ -f "$HOME/.aliases" ]; then
	source "$HOME/.aliases"
fi

#I should check here if this dir is good
export PATH=~/bin:$PATH

# key bindings found online somewhere
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

ackpath="`which ack 2>/dev/null`"
ackgreppath="`which ack-grep 2>/dev/null`"

if [ ! -f /$ackpath ] || [ ! -x /$ackpath ]; then
	if [ -f /$ackgreppath ] && [ -x /$ackgreppath]; then
		alias ack=ack-grep
	fi
fi


# Devin's extract files
xtr () {
    local ARCHIVE
    local archive
    local unrecognized
    local success
    for ARCHIVE in "$@"; do
        echo -n Extracting "$ARCHIVE"... ''
        archive=`echo "$ARCHIVE"|tr A-Z a-z`
        unrecognized=0
        success=0
        case "$archive" in
            *.tar)
                tar xf "$ARCHIVE" && success=1
                ;;
            *.tar.gz|*.tgz)
                tar xzf "$ARCHIVE" && success=1
                ;;
            *.tar.bz2|*.tbz2)
                tar xjf "$ARCHIVE" && success=1
                ;;
            *.gz)
                gunzip "$ARCHIVE" && success=1
                ;;
            *.bz2)
                bunzip2 "$ARCHIVE" && success=1
                ;;
            *.zip|*.jar|*.pk3|*.pk4)
                unzip -o -qq "$ARCHIVE" && success=1
                ;;
            *.rar)
                unrar x "$ARCHIVE" && success=1
                ;;
            *)
                unrecognized=1
                ;;
        esac
        if [ $unrecognized = 1 ]; then
            echo -e '[\e[31;1munrecognized file extension\e[0m]'
        elif [ $success = 1 ]; then
            echo -e '[\e[32;1mOK\e[0m]'
        fi
    done
}

swap(){
    file1="$1"
    file2="$2"
    mv "$file1" "$USER"".swapfile.""$file1"
    mv "$file2" "$file1"
    mv "$USER"".swapfile.""$file1" "$file2"
}

mvln(){
   mv $1 $2
   ln -s $2 $1
}
