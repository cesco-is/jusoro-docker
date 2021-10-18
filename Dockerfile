FROM openjdk:8-jdk-alpine

LABEL maintainer="melong0124 <melong0124@me.com>"

RUN apk update && apk --no-cache add bash tzdata

# 변수 설정
ENV DW_FILE_NAME jusoro-2.0.0-linux64-internet.tar.gz
ENV APP_PATH /apptemp/jusoro
ENV APP_BIN_PATH ${APP_PATH}/bin
ENV TZ=Asia/Seoul

# java 경로 변경
# solr root 실행 관련 로직 추가
COPY opt/startup.sh /startup.sh

# 관리자 ip 설정
COPY opt/jetty.xml /jetty.xml

# 폴더 생성
RUN mkdir -p /tmp && mkdir -p /apptemp

RUN wget -O \
      /tmp/${DW_FILE_NAME} \
      "https://www.juso.go.kr/dn.do?fileName=${DW_FILE_NAME}&realFileName=${DW_FILE_NAME}&reqType=jusoro&gubun=jusoro&ctprvnCd=LINUX&stdde=LINUX64" \
      && tar zxvf /tmp/${DW_FILE_NAME} -C /apptemp \
      && rm -r -f /tmp \
      && rm -r -f /apptemp/jdk1.8.0_102_linux64 \
      && mv -f /startup.sh ${APP_BIN_PATH}/startup.sh \
      && mv -f /jetty.xml ${APP_PATH}/server/etc/jetty.xml

# /app/datas : 주소 데이터
# /app/jusoro/server/logs : 로그
# /app/jusoro/server/etc : jetty 옵션 설정파일들
# /app/jusoro/server/resources : 로그 옵션 설정파일들
VOLUME ["/jusoro-app"]

# port 오픈
EXPOSE 8983

COPY docker-entrypoint.sh /docker-entrypoint.sh

CMD ["bash", "/docker-entrypoint.sh"]