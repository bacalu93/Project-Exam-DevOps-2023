. ./test.sh
if [ $STATUS == "SUCCESS" ];
then
    docker tag todoapp_todolist_webapp:latest andrei9310/my-to-do-app-todolist_webapp:latest
    docker push andrei9310/my-to-do-app-todolist_webapp:latest
    docker tag mysql:8.0.12 andrei9310/mysql-todo-app:latest
    docker push andrei9310/mysql-todo-app:latest
    echo "This webpage is available and the docker's images was pushed to https://hub.docker.com/ !"
else
    echo "This webpage is not available!"
fi

