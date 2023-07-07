#!/bin/bash
# put your domain in this var
http=http://todo-andrei.link

# save the status in some variable 
status=`curl $http -k -s -f -o /dev/null && echo "SUCCESS" || echo "ERROR"`    

# print results (or use it in your scripts)
echo "testing $http=$status"