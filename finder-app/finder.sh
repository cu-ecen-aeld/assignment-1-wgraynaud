#!/bin/bash
num_args=$#
if [ $num_args != 2 ]
then
	echo "Please supply two string arguments: filesdir and searchstr."
	exit 1
fi

filesdir=$1
if ! [ -d "$filesdir" ]
then
	echo "The filesdir supplied does not correspond to an existing directory."
	exit 1
fi

searchstr=$2

num_files=0
num_matches=0
for file in "$filesdir"/*; do
	((num_files+=1))
	while read -r line; do
		if [[ $line == *"$searchstr"* ]]
		then
			((num_matches+=1))
		fi
	done <"$file"
done

echo "The number of files are $num_files and the number of matching lines are $num_matches"
