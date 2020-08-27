#!/bin/bash

if [[ -z $1 ]]
then
    echo "Input cannot be empty."
    echo "Example: fkill discord 9 (or 15 if empty)"
    exit 0
fi

cnt1=$(ps aux | grep -i $1 | grep -v grep | grep -v "kill_process.sh" | wc -l)
klevel=${2:-15}

echo "Searching for '$1'"
echo "Found" $cnt1 "running processes."
if [[ $cnt1 > 0 ]]
then
    ps aux | grep -i $1 | grep -v grep | grep -v "kill_process.sh" | awk '{print $2}' | xargs sudo kill $klevel
    cnt2=$(ps aux | grep -i $1 | grep -v grep | grep -v "kill_process.sh" | wc -l)
    echo "Terminated" $(expr $cnt1 - $cnt2) "processes."
else
    echo "No process to terminate."
fi

# Derived from https://stackoverflow.com/a/30486159
