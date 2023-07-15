#!/bin/bash
# put your domain in this var

MYWEBSITE=http://todo-andrei.link

# save the status in some variable 
STATUS=`curl $MYWEBSITE -k -s -f -o /dev/null && echo "SUCCESS" || echo "ERROR"`    

# print results (or use it in your scripts)
echo "testing $MYWEBSITE=$STATUS"
