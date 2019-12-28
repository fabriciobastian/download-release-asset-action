#!/bin/sh -l

GITHUB="https://api.github.com"
# VERSION=$1
# REPO=$2
# FILE=$3
VERSION=$INPUT_version
REPO=$INPUT_repo
FILE=$INPUT_file

echo "Version: $VERSION - Repo: $REPO - File: $FILE"

if [ "$VERSION" = "latest" ]; then
  # Github should return the latest release first.
  parser=".[0].assets | map(select(.name == \"$FILE\"))[0].id"
else
  parser=". | map(select(.tag_name == \"$VERSION\"))[0].assets | map(select(.name == \"$FILE\"))[0].id"
fi;

asset_id=`curl -H "Accept: application/vnd.github.v3.raw" -s $GITHUB/repos/$REPO/releases | jq "$parser"`
if [ "$asset_id" = "null" ]; then
  echo "ERROR: Version $VERSION was not found! 1>&2"
  exit 1
fi;

wget -q --header='Accept:application/octet-stream' \
  $GITHUB/repos/$REPO/releases/assets/$asset_id \
  -O $FILE
