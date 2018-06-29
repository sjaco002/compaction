import re

f1 = open('log.txt', 'r')
f7 = open('nohup.out', 'r')
f2 = open('csv/readTimes.csv', 'w')
f19 = open('csv/MergeSizes.csv', 'w')
f4 = open('csv/writes.csv', 'w')
f6 = open('csv/compactionTimes.csv', 'w')
f8 = open('csv/readHits.csv', 'w')
f9 = open('csv/readKeys.csv','w')
f12 = open('csv/readTotalTimes.csv','w')
f13 = open('csv/flushTimes.csv','w')
f14 = open('csv/ReadTrace.csv','w')
for line in f1:
	splitLine = line.split(" ")
	if (len(splitLine) < 4):
		writeLine = ""	
	elif (splitLine[1] == "Merged:"):
		writeString = "0," + splitLine[2][:-1] + "," + splitLine[3][:-1] + "," + splitLine[4] + "," + splitLine[8] + "," + splitLine[11] + "\n"
		f19.write(writeString)
	elif (splitLine[1] == "Full"):
		writeString = "1," + splitLine[2][:-1] + "," + splitLine[3][:-1] + "," + splitLine[4] + "," + splitLine[8] + "," + splitLine[11] + "\n"
		f19.write(writeString)
	elif (splitLine[1] == "ReadTrace:"):
		writeString =  splitLine[3] + "," + splitLine[4] + "," + splitLine[8] + "," + splitLine[2] + "," + splitLine[12] + "," + splitLine[13] + "," + splitLine[14] + "\n"
		f14.write(writeString)
	elif (splitLine[4] == "Write"):
		writeString = splitLine[6] + "," + splitLine[10] + "\n"
		f4.write(writeString)
	elif (splitLine[5] == "Search"):
		if (splitLine[6] == "micro:"):
			writeString = splitLine[7] + "," + splitLine[8] + "," + splitLine[9] + "," + splitLine[10] + "," + splitLine[11] + "," + splitLine[15] + "\n"
			f2.write(writeString)
	elif (splitLine[4] == "Total"):
		writeString = splitLine[7] + "," + splitLine[11] + "\n"
		f12.write(writeString)
	elif (splitLine[4] == "finished"):
		writeString = splitLine[9] + "," + splitLine[13] + "," + splitLine[19] + "\n"
		if (splitLine[6] == "flush"):
			f13.write(writeString)
		else:	
			f6.write(writeString)
for line in f7:
	splitLine = line.split(" ")
	if (len(splitLine) == 1):
		f8.write("1\n")
	elif (splitLine[1] == "content-length:" and splitLine[2][0] == "0"):
		f8.write("0\n")
	elif (splitLine[1] == "GET"): 
		splitQuery=splitLine[2].split("%20")
		f9.write(splitQuery[12] + "\n")	

