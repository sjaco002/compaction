from socket import socket
from random import randint
import time

ip = '169.235.27.209'
port1 = 10001

sock1 = socket()
sock1.connect((ip, port1))

line="{\"id\":int64(\""
lineEnd="\"),\"message_text\":\" like sprint its platform is amazing\",\"created_at\":\"2005-08-10T10:10:00\",\"country\":\"US\"}"
i = 0

#last number is the number of minutes  to run
t_end = time.time() + 60 * 60 * 8 

while(time.time() < t_end):
		num = randint(0,80300000);
        	sock1.sendall(line +  str(num) + lineEnd)
        	i=i+1

sock1.close()
