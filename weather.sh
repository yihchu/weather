#!/bin/sh

set -eux

CITY=Dalian
LANGUAGE="zh-CN"
UNIT=m
#UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36"
UA="Mozilla/5.0(iPhone;U;CPUiPhoneOS4_3_3likeMacOSX;en-us)AppleWebKit/533.17.9(KHTML,likeGecko)Version/5.0.2Mobile/8J2Safari/6533.18.5"

curl \
  -H "Accept-Language: $LANGUAGE" \
  -H "User-Agent: $UA" \
  -o result.html \
  wttr.in/$CITY?format=4\&$UNIT
