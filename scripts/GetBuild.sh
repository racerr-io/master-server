#!/bin/bash

# run this script from the root of the repository using npm run getBuild

API_URL="https://api.github.com/repos/racerr-io/racerr"

RACERR_VERSION=`cat RACERR_VERSION.txt`
echo "Downloading build - Racerr $RACERR_VERSION (WebGL)"
ASSET_ID=$(curl $API_URL/releases/tags/$RACERR_VERSION | jq -r ".assets | map(select(.name == \"WebGLBuild.zip\"))[0].id")

if [[ -z "$ASSET_ID" ]]; then
  echo "Failed to retrieve Racerr build."
  exit 1
fi

AUTH_HEADER=""
if [[ ! -z "$GITHUB_TOKEN" ]]; then
  echo Authenticating with GitHub authorisation token
  AUTH_HEADER="Authorization: token $GITHUB_TOKEN"
fi

curl \
  -J \
  -L \
  -H "$AUTH_HEADER" \
  -H "Accept: application/octet-stream" \
  "$API_URL/releases/assets/$ASSET_ID" \
  -o WebGLBuild.zip

unzip WebGLBuild.zip

mv build/WebGL/WebGL/Build* static/Build