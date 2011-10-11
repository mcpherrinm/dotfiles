feh --bg-scale ~/.bgimage.jpg

xmodmap -e 'remove Lock = Caps_Lock'
xmodmap -e 'keysym Caps_Lock = Control_L'
xmodmap -e 'add Control = Control_L'
xmodmap -e 'keycode 108 = Super_R'
xmodmap -e 'remove Mod1 = Super_R'
xmodmap -e 'remove Mod4 = Super_R'
xmodmap -e 'add Mod4 = Super_R'
xmodmap -e 'keycode 135 = Multi_key'

unclutter &

urxvt &

xmonad
