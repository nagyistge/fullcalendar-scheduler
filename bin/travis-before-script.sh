#!/usr/bin/env bash

# always immediately exit upon error
set -e

# start in project root
cd "`dirname $0`/.."

if [[ -f 'fullcalendar-branch.txt' ]]
then
	echo "Creating symlink to fullcalendar branch checkout."
	cd node_modules
	rm -rf "fullcalendar"
	ln -s "../fullcalendar" "fullcalendar"
fi
