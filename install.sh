#!/bin/sh

for i in *; do
	r="`realpath \"$i\"`"
	if [ $r != "`realpath \"$0\"`" ] && [ $r != "`realpath README.markdown`" ] ; then
		if [ -e $r ]; then
			echo "Exists: $r"
			#todo: get rid of safely!
		else
			ln -s $r ~/."$i"
		fi
	fi
done
