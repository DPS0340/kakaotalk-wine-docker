#!/bin/bash

# from https://hamonikr.org/Free_Board/82037

xhost +local:docker

docker stop $(docker ps -aq --filter "name=kakaotalk-install")
docker rm $(docker ps -aq --filter "name=kakaotalk-install")

sudo docker run -it -d --name kakaotalk-install \
--hostname kakao-install \
-v /run/user/1000:/run/user/1000 \
-v /dev:/dev \
-v /etc/localtime:/etc/localtime:ro \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
--ipc=host --shm-size=256m --net=host \
-v $HOME:/home/kakaotalk \
-e DISPLAY=unix$DISPLAY \
-e XDG_RUNTIME_DIR=/run/user/1000 \
-e PULSE_SERVER=pulseaudio \
-e "GTK_IM_MODULE=kime" \
-e "XMODIFIERS=@im=kime" \
-e "QT_IM_MODULE=kime" \
a891/kakaotalk-install

# end https://hamonikr.org/Free_Board/82037

echo "와인에서의 카카오톡 설치를 완료하신 뒤, 아무 키나 눌러서 진행해주세요!"

read -n 1 -s -r -p "Press any key to continue..."

sudo rm image.tar

sudo docker export $(docker ps -aq --filter "name=kakaotalk-install") | sudo tee -a image.tar > /dev/null

sudo docker import image.tar a891/kakaotalk
