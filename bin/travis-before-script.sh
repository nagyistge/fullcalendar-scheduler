#!/usr/bin/env bash

# always immediately exit upon error
set -e

# start in project root
cd "`dirname $0`/.."

if [[ -f 'fullcalendar-branch.txt' ]]
then
	branch=`cat 'fullcalendar-branch.txt'`

	rm -rf "fullcalendar"

	if [[ -d "fullcalendar" ]]
	then
		echo "Already a nested fullcalendar git project."
		echo "Ensuring an up-to-date '$branch' branch."

		cd "fullcalendar"
		git fetch origin
		git checkout --quiet "origin/$branch"
	else
		echo "Cloning a fresh fullcalendar repo,"
		echo "initialized on the '$branch' branch."

		git clone -b "$branch" "https://github.com/fullcalendar/fullcalendar.git"
		cd "fullcalendar"
	fi

	# already in the 'fullcalendar' directory
	# build the dist files
	npm install
	gulp dist

	echo "Creating symlink."
	cd ../node_modules
	ln -s "../fullcalendar" "fullcalendar"
else

	if [[ -d "fullcalendar" ]]
	then
		echo "Removing the nested fullcalendar git project."

		rm -rf "fullcalendar"
	fi
fi
