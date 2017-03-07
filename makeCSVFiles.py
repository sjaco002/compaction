import re

f1 = open('log.txt', 'r')
f2 = open('csv/readTimes.csv', 'w')
f3 = open('csv/readStacks.csv', 'w')
f4 = open('csv/writes.csv', 'w')
f5 = open('csv/compactionStarts.csv', 'w')
f6 = open('csv/compactionStops.csv', 'w')
for line in f1:
	splitLine = line.split(" ")
	if (splitLine[4] == "Write"):
		writeString = splitLine[6] + "," + splitLine[10] + "\n"
		f4.write(writeString)
	elif (splitLine[4] == "Read"):
		writeString = splitLine[6] + "," + splitLine[10] + "\n"
		f2.write(writeString)
	elif (splitLine[4] == "Read:"):
		writeString = splitLine[8] + "," + splitLine[12] + "\n"
		f3.write(writeString)
	elif (splitLine[4] == "started"):
		writeString = "1," + splitLine[12] + "\n"
		f5.write(writeString)
	elif (splitLine[4] == "finished"):
		writeString = "1," + splitLine[12] + "\n"
		f6.write(writeString)
f1.close()
f2.close()
f3.close()
f4.close()
f5.close()
f6.close()

