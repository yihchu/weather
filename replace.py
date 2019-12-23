import fileinput
import sys


for line in fileinput.input("result.html", inplace=1):
    if 'head' in line:
        line=line 
    else:
        line=line.replace("天氣預報： Dalian",sys.argv[1])
    print(line,end="")
