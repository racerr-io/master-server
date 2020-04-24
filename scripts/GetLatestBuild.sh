#!/bin/bash

API_URL="https://api.github.com/repos/racerr-io/unity-core"

if [[ -z "$PROD" ]]; then
  echo Downloading staging WebGL client build
  ASSET_ID=$(curl $API_URL/releases | jq -r ".[0].assets | map(select(.name == \"WebGLBuild.zip\"))[0].id")
else
  echo Downloading production WebGL client build
  ASSET_ID=$(curl $API_URL/releases/latest | jq -r ".assets | map(select(.name == \"WebGLBuild.zip\"))[0].id")
fi

if [[ -z "$ASSET_ID" ]]; then
  echo "Could not find asset id"
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