#!/bin/sh

for i in *; do
	if [ "`realpath $i`" != "`realpath $0`" ]; then
		ln -s `realpath $i` ~/.$i
	fi
done
