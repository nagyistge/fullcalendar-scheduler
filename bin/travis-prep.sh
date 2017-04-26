#!/usr/bin/env bash

# always immediately exit upon error
set -e

# start in project root
cd "`dirname $0`/.."

if [[ -f 'fullcalendar-branch.txt' ]]
then
	branch=`cat 'fullcalendar-branch.txt'`

	cd "node_modules"

	if [[ -d "fullcalendar/node_modules" ]]
	then
		echo "Already a nested fullcalendar git project."
		echo "Ensuring an up-to-date '$branch' branch."

		cd "fullcalendar"
		git fetch origin
		git checkout --quiet "origin/$branch"
	else
		echo "Cloning a fresh fullcalendar repo,"
		echo "initialized on the '$branch' branch."

		rm -rf "fullcalendar"
		git clone -b "$branch" "https://github.com/fullcalendar/fullcalendar.git"
		cd "fullcalendar"
	fi

	# build
	npm install
	gulp dist
else

	if [[ -d "node_modules/fullcalendar/node_modules" ]]
	then
		echo "Removing the nested fullcalendar git project,"
		echo "and using the proper fullcalendar dependency."

		rm -rf "node_modules/fullcalendar"
		npm install
	fi
fi
