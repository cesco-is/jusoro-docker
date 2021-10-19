# 주소검색솔루션 for Docker

## 개요

비공식 [주소검색솔루션](https://www.juso.go.kr/addrlink/jusoSearchSolutionIntroduce.do) Dockerized 입니다.

## 사용법

### docker build

```bash
docker build --pull --rm -f "Dockerfile" -t jusorodockerize:latest "."
```

### docker run

```bash
docker run -d -p 18983:8983 --name jusorodockerize jusorodockerize:latest
```

### volumes

    - 주요 파일 경로
      - /jusoro-app : 주소 및 색인 데이터 (해당 폴더를 백업하세요.)

## 기타

개발자센터 : https://www.juso.go.kr/addrlink/jusoSearchSolutionIntroduce.do