#!/bin/bash

set -eu

scriptdir=$(dirname "$0")
SRC=$(readlink -f "$scriptdir")
DEST="$HOME"

for r in "$SRC"/*; do
	srcfile=$(basename "$r")
	p="$DEST/.$srcfile"
	if [ "$r" != "$SRC/install.sh" ] && [ "$r" != "$SRC/README.markdown" ] ; then
		if [ -e "$p" ]; then
			if [ -L "$p" ] ; then
				e=$(readlink "$p")
				if [ "$e" -ef "$r" ]; then
					echo "#Already installed $e"
				else
					echo "#Points elsewhere: $e isnt $r"
				fi
			else
				echo "#Exists: $p"
			fi
		else
			echo "#Installing $p"
			ln -s "$r" "$p"
		fi
	fi
done
