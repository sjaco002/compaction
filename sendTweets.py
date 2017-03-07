from socket import socket
import random
import time

ip = '169.235.27.209'
port1 = 10001

sock1 = socket()
sock1.connect((ip, port1))

line="{\"id\":int64(\""
lineEnd="\"),\"user\":{\"screen_name\":\"SloanCurry_530\",\"language\":\"en\",\"friends_count\":95,\"status_count\":278,\"name\":\"Sloan Curry\",\"followers_count\":88},\"latitude\":41.119998931884766,\"longitude\":96.41000366210938,\"message_text\":\" like sprint its platform is amazing\",\"created_at\":\"2005-08-10T10:10:00\",\"country\":\"US\"}"
i = 0

#last number is the number of minutes  to run
t_end = time.time() + 60 * 60 

while(time.time() < t_end):
        sock1.sendall(line +  str(i) + lineEnd)
        i=i+1

sock1.close()
