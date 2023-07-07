#!/bin/bash
# put your domain in this var
http=http://todo-andrei.link

# save the status in some variable 
status=`curl $http -k -s -f -o /dev/null && echo "SUCCESS" || echo "ERROR"`    

# print results (or use it in your scripts)
echo "testing $http=$status"
if [ $status == "SUCCESS" ]
then
    docker tag todoapp_todolist_webapp:latest andrei9310/my-to-do-app-todolist_webapp:latest.
    docker push andrei9310/my-to-do-app-todolist_webapp:latest.
    docker tag mysql:8.0.12 andrei9310/mysql-todo-app:latest.
    docker push andrei9310/mysql-todo-app:latest.
else
    echo "This webpage is not available!"
fi
