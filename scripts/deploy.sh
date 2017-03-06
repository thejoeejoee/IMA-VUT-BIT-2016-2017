#!/bin/bash

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"
TEMP_PATH=`tempfile`

REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`

echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
git clone $REPO out
cd out/01
make
mv hw.pdf $TEMP_PATH
git checkout $TARGET_BRANCH
mv $TEMP_PATH hw.pdf
git add hw.pdf

git config --global user.email "noreply@travis.com"
git config --global user.name "Travis CI"

git commit -m "Compiled pdf from ${SHA}."
git push $SSH_REPO


# Clean out existing contents
