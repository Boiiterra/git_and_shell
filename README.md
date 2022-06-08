# Git and shell
My small experiment with shell scripts

## Setup:
```shell
git clone "https://github.com/TerraBoii/GH_auto.git"
cd GH_auto
source scripts.sh
```

## Usage:
```bash
# To run the type in commands:
nbranch "<branch name>" # to create new branch
rmabranch # to delete all branches except stable? current and default
addcomall <message> # to add all files in current directory and commit with message
addcomfi <file> <message> # to add file in current directory and commit with message 
ghsync # to pull all changes from remote repository
ghdpush # to push changes to remote repository
getprloc <pull request ID> # to get pull request on local machine
```
