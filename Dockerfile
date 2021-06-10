# from https://github.com/leoh0/dockerfiles/blob/master/kakaotalk-wine-root/Dockerfile

FROM alpine:3.9

RUN echo 'x86' > /etc/apk/arch && \
        apk --no-cache add \
        ca-certificates \
        wget \
        wine \
        zenity

RUN wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
        chmod +x ./winetricks && \
		mv ./winetricks /usr/local/bin/

RUN mkdir -p /usr/share/fonts/NanumFont && \
        cd /usr/share/fonts/ && \
        wget http://cdn.naver.com/naver/NanumFont/fontfiles/NanumFont_TTF_ALL.zip && \
        unzip NanumFont_TTF_ALL.zip -d NanumFont && \
        rm -f NanumFont_TTF_ALL.zip

ENV LANG=ko_KR.UTF-8 \
    LANGUAGE=ko_KR.UTF-8

COPY kakaotalk-root.reg /usr/local/bin/kakaotalk-root.reg
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]