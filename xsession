xmodmap -e 'remove Lock = Caps_Lock'
xmodmap -e 'keysym Caps_Lock = Control_L'
xmodmap -e 'add Control = Control_L'
xmodmap -e 'keycode 108 = Super_R'
xmodmap -e 'remove Mod1 = Super_R'
xmodmap -e 'remove Mod4 = Super_R'
xmodmap -e 'add Mod4 = Super_R'
xmodmap -e 'keycode 135 = Multi_key'

urxvt &
urxvt &

export PATH=$HOME/bin:$HOME/local/bin:$PATH

echo $PATH > ~/test
echo $SHELL >> ~/test


diff -q ~/.xmonad/compiled-on /etc/issue.net
if [ $? -ne 0 ]; then
  xmonad --recompile
  cat /etc/issue.net > ~/.xmonad/compiled-on
  hostname > ~/.xmonad/compile-hostname
fi

xmonad
