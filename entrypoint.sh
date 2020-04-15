#!/bin/sh -l

GITHUBAPI="api.github.com"
VERSION=$1
REPO=$2
FILE=$3
OUT=${4%/}
TOKEN=$5

echo "Version: $VERSION - Repo: $REPO - File: $FILE - Out: $OUT"

if [ "$VERSION" = "latest" ]; then
  parser=".[0].assets | map(select(.name == \"$FILE\"))[0].id"
else
  parser=". | map(select(.tag_name == \"$VERSION\"))[0].assets | map(select(.name == \"$FILE\"))[0].id"
fi;

if [ ! -z "$TOKEN" ]; then
  asset_id=`curl -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github.v3.raw" -s https://$GITHUBAPI/repos/$REPO/releases | jq "$parser"`
else
  asset_id=`curl -H "Accept: application/vnd.github.v3.raw" -s https://$GITHUBAPI/repos/$REPO/releases | jq "$parser"`
fi;

if [ "$asset_id" = "null" ]; then
  echo "ERROR: Version $VERSION was not found! 1>&2"
  exit 1
fi;

mkdir -p $OUT

if [ ! -z "$TOKEN" ]; then
  wget -q --auth-no-challenge --header='Accept:application/octet-stream' https://$TOKEN:@$GITHUBAPI/repos/$REPO/releases/assets/$asset_id -O $OUT/$FILE
else
  wget -q --header='Accept:application/octet-stream' https://$GITHUBAPI/repos/$REPO/releases/assets/$asset_id -O $OUT/$FILE
fi;
