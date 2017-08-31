#!/bin/bash

IFS=$(echo -en "\n\b")
function cpup() {
	for file in `ls $1`
	do
		if [ "$1/$file" != "$outpath" ]
		then
			if [ -d $1"/"$file ]
			then
				cpup $1"/"$file
			else
				dirname=${1//\//@}
				cp $1"/"$file $outpath"/"${dirname}${file}
				fi
		fi
	done
}

outpath="$1/all"
if [ ! -e  $outpath ]
then
	mkdir $outpath
fi

cpup $1
