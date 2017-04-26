#!/usr/bin/env bash

# always immediately exit upon error
set -e

# start in project root
cd "`dirname $0`/.."

# remove the possible symlink because `npm install` will complain about it in future runs.
# the before-script will install the symlink if need be.
if [[ -L "node_modules/fullcalendar" ]]
then
	echo "Removing 'node_modules/fullcalendar' symlink."
	rm "node_modules/fullcalendar"
fi
