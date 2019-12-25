import fileinput
import sys


for line in fileinput.input("result.html", inplace=1):
    if 'head' in line:
        line=line 
    else:
        line=line.replace("YYYXXXWWW",sys.argv[1])
    line=line.replace("body class=\"\"", "body bgcolor=\"#FFFAF0\"")
    line=line.replace("ffff00", "CD6600")
    print(line,end="")
