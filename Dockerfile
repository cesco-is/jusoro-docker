FROM openjdk:8-jdk-alpine

# 메타데이터
LABEL maintainer="lapras42 <lapras42@cesco.co.kr>"

# bash, tzdata 설치 및 타임존 설정
RUN apk update && apk --no-cache add bash tzdata wget \
    && cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && echo "Asia/Seoul" > /etc/timezone

# 환경 변수
ENV DW_FILE_NAME=jusoro-2.0.0-linux64-internet.tar.gz \
    APP_PATH=/apptemp/jusoro \
    APP_BIN_PATH=/apptemp/jusoro/bin \
    TZ=Asia/Seoul

# 스크립트 및 설정 복사
COPY opt/startup.sh /startup.sh
COPY opt/jetty.xml /jetty.xml
COPY docker-entrypoint.sh /docker-entrypoint.sh

# 실행 권한 부여
RUN chmod +x /startup.sh /docker-entrypoint.sh

# 앱 설치
RUN mkdir -p /tmp /apptemp \
    && wget -O /tmp/${DW_FILE_NAME} \
      "https://www.juso.go.kr/dn.do?fileName=${DW_FILE_NAME}&realFileName=${DW_FILE_NAME}&reqType=jusoro&gubun=jusoro&ctprvnCd=LINUX&stdde=LINUX64" \
    && rm -rf /apptemp/jusoro \                    # 기존 디렉토리 정리
    && mkdir -p /apptemp \                         
    && tar zxvf /tmp/${DW_FILE_NAME} -C /apptemp \
    && mv -f /startup.sh ${APP_BIN_PATH}/startup.sh \
    && mv -f /jetty.xml ${APP_PATH}/server/etc/jetty.xml \
    && rm -rf /tmp \
    && rm -rf /apptemp/jdk1.8.0_102_linux64

# 볼륨, 포트
VOLUME ["/jusoro-app"]
EXPOSE 8983

# 엔트리포인트
ENTRYPOINT ["bash", "/docker-entrypoint.sh"]
