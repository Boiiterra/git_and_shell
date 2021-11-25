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

function addcomall() {
    if [ -z $1 ]; then
        echo "Error: no commit message is entered"
    else
        echo "all modified file added"
        git add .
        echo "commiting with message -> $1"
        git commit -m "$1"
    fi
}

function addcomfi() {
    if [ $# -ne 2 ]; then
        echo "Error: no file and/or commit message is entered"
        echo "Try: $0 <file> <commit message>"
    else
        if [ -e $1 ]; then
            echo "all modified file added"
            git add $1
            echo "commiting with message -> $2"
            git commit -m "$2"
        else
            echo "Error: file $1 not found in current directory"
        fi
    fi
}

function ghsync() {
    git pull
}

function ghdpush() {
    defBr=`git config --global init.defaultBranch`
    git push origin $defBr
}

function getprloc() {
    if [ -z $1 ]; then
        echo "Error: no argument is given" 
        echo "Try: $0 <pull request ID>"
    else
        if [[ $1 =~ ^[0-9]+$ ]]; then
            echo "getting pull request ID -> $1"
            git fetch origin pull/$1/head
        else
            echo "Error: your are supposed to enter pull request ID number not '$1'"
        fi
    fi
}