#!/bin/sh

for i in *; do
	r="`realpath \"$i\"`"
	p=~/."$i"
	if [ $r != "`realpath \"$0\"`" ] && [ $r != "`realpath README.markdown`" ] ; then
		if [ -e $p ]; then
			echo "Exists: $p"
			#todo: get rid of safely!
		else
			echo "Installing $p"
			ln -s $r $p
		fi
	fi
done
