import fileinput
import sys
import base64

b64=base64.encodestring(open("./Dalian_m.png","rb").read())
baseUrl="data:image/png;base64," + str(b64,'utf-8')

for line in fileinput.input("result.html", inplace=1):
    line=line.replace("YYYXXXWWW", sys.argv[1])
    line=line.replace("WWWXXXYYY", baseUrl)
    print(line,end="")
