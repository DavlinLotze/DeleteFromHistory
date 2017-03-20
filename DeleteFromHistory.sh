#!/bin/bash
#example bash script to delete file from github history
#directions:
#https://rtyley.github.io/bfg-repo-cleaner/

#file to delete:
#example.file

read -p "Enter clone link:" $clonelink
read -p "Enter filename to delete: " $filetodelete

#bash commands:
cd "$(dirname "$0")"
git clone --mirror "$clonelink"
read -p "Press any key to continue"
cd "$(dirname "$0")/$reponame.git"
read -p "Press any key to continue"
java -jar bfg-1.12.15.jar --delete-files "$filetodelete"
read -p "Press any key to continue"
git reflog expire --expire=now --all && git gc --prune=now --aggressive
read -p "Press any key to continue"
git push
echo "Operation complete. Determination of success is left to the user."