#!/bin/bash

SRC="`readlink -f $(dirname $0)`"
DEST=$HOME

for r in $SRC/*; do
	p=$DEST/."`basename $r`"
	if [ "$r" != "$SRC/install.sh" ] && [ "$r" != "$SRC/README.markdown" ] ; then
		if [ -e "$p" ]; then
			if [ -L "$p" ] ; then
				e=`readlink "$p"`
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
			echo ln -s $r $p
		fi
	fi
done

make -C ssh
