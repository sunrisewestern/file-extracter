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
				if is_format $file $format
				then
					local dirname=${1//\//@}
					cp -n $1"/"$file $outpath"/"${dirname}${file}
				fi
			fi
		fi
	done
}

pic=(BMP JPG JPEG PNG GIF)
vid=(3GP ASF AVI FLV M4V MKV MOV MP4 MPEG MPG MPG2 MPG4 RMVB WMV MTS)
aud=(WAV MID CDA MP3 WMA AAC RA OGG APE FLAC M4A M4P AIF AIFF AVI)

function is_vid(){
	local form=${1##*.}
	for i in ${vid[@]}
	do
		local j=$(echo $i | awk '{print tolower($0)}' )
		if [[ "$form" == "$i" || "$form" == "$j" ]]
		then
			return 0
		fi
	done
	return 1
}

function is_pic(){
	local form=${1##*.}
	for i in ${pic[@]}
	do
		local j=$(echo $i | awk '{print tolower($0)}' )
		if [[ "$form" == "$i" || "$form" == "$j" ]]
		then
			return 0
		fi
	done
	return 1
}

function is_aud(){
	local form=${1##*.}
	for i in ${aud[@]}
	do
		local j=$(echo $i | awk '{print tolower($0)}' )
		if [[ "$form" == "$i" || "$form" == "$j" ]]
		then
			return 0
		fi
	done
	return 1
}

function is_else() {
	if [[ $2 == "" ]]
	then
		return 0
	else
		local form=${1##*.}
		if [[ $form == "$2" ]]
		then
			return 0
		fi
	fi
	return 1
}


function is_format(){
	case $2 in
	p|pic|picture)
		is_pic $1
        ;;
    v|vid|video)
		is_vid $1
        ;;
    *)
		is_else $1 $2
        ;;
esac
}

# main

format=$2
expath=${1%/*}
postpath=${1##*/}
cd "$expath"

if [[ ! -n "$2" ]]
then
	outpath="$postpath/all"
else
	outpath="$postpath"/"$2"
fi

if [ ! -e  $outpath ]
then
	mkdir $outpath
fi

cpup $postpath
