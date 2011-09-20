#!/bin/bash

for i in *; do
	r="`pwd`/$i"
	p=~/."$i"
	if [ $r != "`pwd`/install.sh" ] && [ $r != "`pwd`/README.markdown" ] ; then
		if [ -e $p ]; then
			if [ -L $p ] ; then
				e=`readlink "$p"`
				if [ $e != $r ]; then
					echo "Points elsewhere: $e isnt $r"
				else
					echo "Already installed $e"
				fi
			else
				echo "Exists: $p"
			fi
		else
			echo "Installing $p"
			ln -s $r $p
		fi
	fi
done

make -C ssh
