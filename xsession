#!/bin/sh

xmod
unclutter &

export PATH=$HOME/bin:$HOME/local/bin:$PATH

echo $PATH > ~/test
echo $SHELL >> ~/test

diff -q ~/.xmonad/compiled-on /etc/issue.net
if [ $? -ne 0 ]; then
  xmonad --recompile
  cat /etc/issue.net > ~/.xmonad/compiled-on
  hostname > ~/.xmonad/compile-hostname
fi

#xmonad
xmonad &
xfce4-session
