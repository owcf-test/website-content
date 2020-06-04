#!/bin/sh

# If a command fails then the deploy stops
set -e

#build public
hugo 

#Clean up
rm -rf ../owcf-test.github.io/*
cp -r ./public/* ../owcf-test.github.io/

# Go To Public folder
cd ../owcf-test.github.io/

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
