#!/bin/sh

# from https://github.com/leoh0/dockerfiles/blob/master/kakaotalk-wine-root/entrypoint.sh

set -e

(
if [ ! -e "$HOME/.wine/drive_c/Program Files/Kakao/KakaoTalk/KakaoTalk.exe" ]; then
    echo "Install wineboot"
    WINEARCH=win32 WINEPREFIX=~/.wine wine wineboot

        winetricks -q d3dx11_43 gdiplus richtx32 msxml6 \
        && winetricks win7

    # Add by DPS0340: kime fix
    wine regedit /usr/local/bin/kakaotalk-root.reg

    wget http://app.pc.kakao.com/talk/win32/KakaoTalk_Setup.exe \
        && wine KakaoTalk_Setup.exe
fi
)

exec wine "$HOME/.wine/drive_c/Program Files/Kakao/KakaoTalk/KakaoTalk.exe"
