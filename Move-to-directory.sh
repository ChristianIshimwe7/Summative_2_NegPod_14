#!/usr/bin/env bash

directory="negpod_14-q1"

if [ ! -d "$directory" ]; then
	mkdir "$directory"
fi

mv main.sh students-list_1023.txt select-emails.sh student-emails.txt "$directory"

echo "MOVED FILES INTO negpod_14-q1 directory"
