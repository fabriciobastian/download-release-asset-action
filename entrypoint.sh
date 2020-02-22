#!/bin/sh -l

GITHUB="https://api.github.com"
VERSION=$1
REPO=$2
FILE=$3
TOKEN=$4

echo "Version: $VERSION - Repo: $REPO - File: $FILE"

if [ "$VERSION" = "latest" ]; then
  parser=".[0].assets | map(select(.name == \"$FILE\"))[0].id"
else
  parser=". | map(select(.tag_name == \"$VERSION\"))[0].assets | map(select(.name == \"$FILE\"))[0].id"
fi;

token_auth = ""
if [ ! -z "$TOKEN"]; then
  echo "--- Using access token ---"
  token_auth = `-H "Authorization: token $TOKEN"`
else
  echo "--- Not using access token ---"
fi;

asset_id=`curl $token_auth -H "Accept: application/vnd.github.v3.raw" -s $GITHUB/repos/$REPO/releases | jq "$parser"`
if [ "$asset_id" = "null" ]; then
  echo "ERROR: Version $VERSION was not found! 1>&2"
  exit 1
fi;

wget -q --header='Accept:application/octet-stream' \
  $GITHUB/repos/$REPO/releases/assets/$asset_id \
  -O $FILE
