import re

f1 = open('log.txt', 'r')
f7 = open('nohup.out', 'r')
f2 = open('csv/readTimes.csv', 'w')
f19 = open('csv/MergeSizes.csv', 'w')
f20 = open('csv/MergeStacks.csv', 'w')
f21 = open('csv/MergeMeta.csv', 'w')
f4 = open('csv/writes.csv', 'w')
f6 = open('csv/compactionTimes.csv', 'w')
f8 = open('csv/readHits.csv', 'w')
f9 = open('csv/readKeys.csv','w')
f12 = open('csv/readTotalTimes.csv','w')
f13 = open('csv/flushTimes.csv','w')
for line in f1:
	splitLine = line.split(" ")
	if (len(splitLine) < 4):
		writeLine = ""	
	elif (splitLine[1] == "Merged:"):
		writeString = "0," + splitLine[2][:-1] + "," + splitLine[3][:-1] + "," + splitLine[4] + "," + splitLine[8] + "\n"
		f19.write(writeString)
	elif (splitLine[1] == "Full"):
		writeString = "1," + splitLine[2][:-1] + "," + splitLine[3][:-1] + "," + splitLine[4] + "," + splitLine[8]  + "\n"
		f19.write(writeString)
	elif (splitLine[2] == "Snapshot:"):
		writeString = splitLine[3] + "\n"	
		f20.write(writeString)
	elif (splitLine[3] == "Snapshot:"):
		writeString = splitLine[4] + "\n"	
		f20.write(writeString)
	elif (splitLine[2] == "Compaction:"):
		splitParts = splitLine[3].split(",")
		writeString = splitParts[0] + "," + splitParts[1] + "," + splitParts[2]
		f21.write(writeString)
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

