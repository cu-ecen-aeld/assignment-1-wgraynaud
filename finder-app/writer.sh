#!/bin/bash
num_args=$#
if [ $num_args != 2 ]
then
	echo "Please supply two string arguments: writefile and writestr."
	exit 1
fi

writefile=$1
writestr=$2

file_name=${writefile##*/}
parent_dir=${writefile%$file_name}

if [[ ! -d "$parent_dir" ]]; then
	mkdir -p $parent_dir
	worked=$?
	if [ $worked -ne 0 ]; then
		echo "The script was unable to create the parent directory of the specified file, $parent_dir"
		exit 1
	fi
fi

touch "$writefile"
worked=$?
if [ $worked -ne 0 ]; then
	echo "The script was unable to create the specified file $writefile"
	exit 1
fi

echo "$writestr" > "$writefile"
