#!/bin/bash

# This function creates new branch
function nbranch() {
    if [ -z $1 ]; then
        echo "no branch name is given. . ."
        git checkout -b new_branch
    else
        git checkout -b $1
    fi
}

# This func deletes all branches except stable, current and default
function rmabranch() {
    defBr=`git config --global init.defaultBranch`
    git branch | grep -v "stable\|*" | grep -v $defBr | xargs git branch -D
}

function adcomall() {
    if [ -z $1 ]; then
        echo "Error: no commit message is entered"
    else
        echo "all modified file added"
        git add .
        echo "commiting with message -> $1"
        git commit -m "$1"
    fi
}

function ghsync() {
    git pull
}

function ghdpush() {
    defBr=`git config --global init.defaultBranch`
    git push origin $defBr
}