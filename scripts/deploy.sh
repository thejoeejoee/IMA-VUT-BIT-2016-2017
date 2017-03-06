SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"
TEMP_PATH=`tempfile`

REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`

git clone $REPO out
cd out
make
mv 01/hw.pdf $TEMP_PATH
git checkout $TARGET_BRANCH
mv $TEMP_PATH 01/hw.pdf
git add 01/hw.pdf
git commit -m "Compiled pdf from ${SHA}."
git git push $SSH_REPO $TARGET_BRANCH


# Clean out existing contents