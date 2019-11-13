#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dcc823be85cf10014aa6a6d/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dcc823be85cf10014aa6a6d
curl -s -X POST https://api.stackbit.com/project/5dcc823be85cf10014aa6a6d/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5dcc823be85cf10014aa6a6d/webhook/build/publish > /dev/null
