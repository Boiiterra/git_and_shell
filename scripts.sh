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

# This func deletes all branches except default, stable and current
function rmabranch() {
    defBr=`git config --global init.defaultBranch`
    git branch | grep -v "stable\|*" | grep -v $defBr | xargs git branch -D
}