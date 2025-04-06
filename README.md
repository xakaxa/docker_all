# docker_all
# Docker-Image-Help
All you need to delete/stop the running container

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
All you need to delete/stop the running container that is using your image(which one you want to remove).

    docker ps -a: To see all the running containers in your machine.
    docker stop <container_id>: To stop a running container.
    docker rm <container_id>: To remove/delete a docker container(only if it stopped).
    docker image ls: To see the list of all the available images with their tag, image id, creation time and size.
    docker rmi <image_id>: To delete a specific image.
    docker rmi -f <image_id>: To delete a docker image forcefully
    docker rm -f (docker ps -a | awk '{print$1}'): To delete all the docker container available in your machine
    docker image rm <image_name>: To delete a specific image

To remove the image, you have to remove/stop all the containers which are using it.

    docker system prune -a: To clean the docker environment, removing all the containers and images.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 docker stop d0105a2cedce
docker container kill $(docker ps | awk '/image_name/ {print $1}')

 docker container kill d0105a2cedce
docker image ls -a
docker rmi -f $(docker images -a -q)
docker image ls -a
docker container kill $(docker ps | awk '/lookup_value/ {print $1}')
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 docker ps -a -q
d0105a2cedce
26f411ce2cac
b8eec762a26e
64d7cea18c9c
 docker rm $(docker ps -a -q)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





















