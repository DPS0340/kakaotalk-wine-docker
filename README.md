# kakaotalk-wine-docker

## Introduction

leoh0님의 카카오톡 도커파일을 기반으로, [kime 카카오톡 관련 이슈](https://github.com/Riey/kime/issues/420)를 해결하고 설치 작업을 스크립트화 시킨 레포지토리입니다.

## Usage

### Installation

```bash
docker-build.sh
kakaotalk-install.sh
```

### Usage

```bash
kakaotalk.sh
```

### Make Alias

bash 사용자라면:
```bash
echo "alias kakaotalk='$(pwd)/kakaotalk.sh'" >> ~/.bashrc
```

zsh 사용자라면:
```bash
echo "alias kakaotalk='$(pwd)/kakaotalk.sh'" >> ~/.zshrc
```

## Fix

### Login Error

방화벽 관련 문제입니다.
```bash
sudo ufw disable
```

## References

https://github.com/leoh0/dockerfiles/blob/master/kakaotalk-wine-root

https://hamonikr.org/Free_Board/82037

https://github.com/Riey/kime/issues/420