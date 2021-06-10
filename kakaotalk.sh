#!/bin/bash

# from https://hamonikr.org/Free_Board/82037

xhost +local:docker

docker stop $(docker ps -aq --filter "name=kakaotalk")
docker rm $(docker ps -aq --filter "name=kakaotalk")

sudo docker run -it -d --rm --name kakaotalk \
--hostname kakao \
--expose 22 \
-v /run/user/1000:/run/user/1000 \
-v /dev:/dev \
-v /etc/localtime:/etc/localtime:ro \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
--ipc=host --shm-size=256m --net=host \
--privileged -e "LANG=ko_KR.UTF-8" -e "LANGUAGE=ko_KR.UTF-8" \
-v $HOME/Downloads/kakao/AppData:/root/.wine/drive_c/users/root/Local\ Settings/Application\ Data/Kakao/KakaoTalk \
-v $HOME/Downloads/kakao:/root/.wine/drive_c/users/root/내\ 문서/카카오톡\ 받은\ 파일 \
-v $HOME:/home/kakaotalk \
-e DISPLAY=unix$DISPLAY \
-e XDG_RUNTIME_DIR=/run/user/1000 \
-e PULSE_SERVER=pulseaudio \
-e "GTK_IM_MODULE=kime" \
-e "XMODIFIERS=@im=kime" \
-e "QT_IM_MODULE=kime" \
a891/kakaotalk /usr/local/bin/entrypoint.sh
