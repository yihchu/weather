
CITY=Dalian
wget wttr.in/$CITY.png


json=$(curl https://rest.shanbay.com/api/v2/quote/quotes/today/)
author=$(echo $json | python3 -c "import sys, json; print(json.load(sys.stdin)['data']['author'])")
content=$(echo $json | python3 -c "import sys, json; print(json.load(sys.stdin)['data']['content'])")
translate=$(echo $json | python3 -c "import sys, json; print(json.load(sys.stdin)['data']['translation'])")
# result=$(echo $content  --$author <br/><br/>天氣預報： 大连)
result=$(echo "<pre style='color:#111111'><br/><span style='font-family: STHeiti;font-size: 20'>早安~ 吴小妍~ </span><br/><br/><HR style='FILTER: alpha(opacity=100,finishopacity=0,style=3)' color=#987cb9 SIZE=3><br/><span style='font-family: Helvetica;font-size: 18'>$content<br/><br/>$translate<br/><br/>---$author</span><br/><br/><br/><HR align=center color=#987cb9 SIZE=2>天氣預報： Dalian</pre>")
echo $result

cp result.bak.html result.html
python3 generate.py "$result"
