
CITY=Dalian

oneLine=$(curl zh.wttr.in/$CITY?format=3\&m)

echo $oneLine
wget zh.wttr.in/$CITY\_u.png
