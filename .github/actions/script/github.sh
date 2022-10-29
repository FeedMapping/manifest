#!/bin/sh
set -e

# Check if deploy to same branch
if [ "${REPOSITORY}" = "${GITHUB_REPOSITORY}" ]; then
  if [ "${GITHUB_REF}" = "refs/heads/${BRANCH}" ]; then
    echo "It's conflicted to deploy on same branch ${BRANCH}"
    exit 1
  fi
fi

# Tell GitHub Pages not to run Jekyll
touch .nojekyll

[ -n "$INPUT_CNAME" ] && echo "$INPUT_CNAME" > CNAME

echo -e "$hr\nDEPLOYMENT\n$hr"
echo -e "\nDeploying to ${REPOSITORY} on branch ${BRANCH}"
echo -e "Deploying to https://github.com/${REPOSITORY}.git\n"

REMOTE_REPO="https://${ACTOR}:${TOKEN}@github.com/${REPOSITORY}.git" && \
  git init --initial-branch=master && \
  git config user.name "${ACTOR}" && \
  git config user.email "${ACTOR}@users.noreply.github.com" && \
  git add . && \
  git commit -m "jekyll build from Action ${GITHUB_SHA}" && \
  git push --force $REMOTE_REPO master:$BRANCH && \
# apt update -y && apt install -y yum && yum install psmisc && fuser -k .git ||
  rm -rf .git && \
  cd ..

exit $?