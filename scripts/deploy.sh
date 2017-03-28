#!/bin/bash

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"
TEMP_PATH1=`tempfile`
TEMP_PATH2=`tempfile`

REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`

echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
git clone $REPO out
cd out
make
mv 01/hw.pdf $TEMP_PATH1
mv 02/hw.pdf $TEMP_PATH2
git checkout $TARGET_BRANCH
mv $TEMP_PATH1 01/hw.pdf
mv $TEMP_PATH2 02/hw.pdf
git add -f 01/hw.pdf
git add -f 02/hw.pdf

git config --global user.email "noreply@travis.com"
git config --global user.name "Travis CI"

git commit -m "Compiled pdf from ${SHA}."
git push $SSH_REPO


# Clean out existing contents
