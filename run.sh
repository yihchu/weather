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
  wttr.in/$CITY

json=$(curl https://api.tecchen.xyz/api/quote/)
author=$(echo $json | python3 -c "import sys, json; print(json.load(sys.stdin)['data']['author'])")
content=$(echo $json | python3 -c "import sys, json; print(json.load(sys.stdin)['data']['content'])")
translate=$(echo $json | python3 -c "import sys, json; print(json.load(sys.stdin)['data']['translation'])")
# result=$(echo $content  --$author <br/><br/>天氣預報： 大连)
result=$(echo "<pre style='color:#111111'><br/><span style='font-family: STHeiti;font-size: 20'>早安~ 吴小妍~ </span><br/><br/><HR style='FILTER: alpha(opacity=100,finishopacity=0,style=3)' color=#987cb9 SIZE=3><br/><span style='font-family: Helvetica;font-size: 18'>$content<br/><br/>$translate<br/><br/>---$author</span><br/><br/><br/><HR align=center color=#987cb9 SIZE=2>天氣預報： Dalian</pre>")
echo $result

python3 replace.py "$result"
