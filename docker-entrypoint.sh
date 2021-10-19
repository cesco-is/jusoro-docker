#!/bin/bash
# jusoro-app 폴더 생성
if [ -d "/jusoro-app/jusoro" ]; then
  # Control will enter here if $DIRECTORY exists.
  echo "jusoro-app Directory already. Continue"
else
  echo "jusoro-app Directory do not exist. Create app Directory." ;
  mkdir -p /jusoro-app
  cd /apptemp
  mv ./jusoro /jusoro-app
  chmod -R 755 /jusoro-app
  cd /
fi

# 기존 테이블 삭제
if [ -d "/apptemp" ]; then
  echo "apptemp Directory already. Delete temp Directory."
  rm -rf /apptemp
else
  echo "apptemp Directory do not exist. Continue"
fi

# 실행
echo 'start jusoro app'
cd /jusoro-app/jusoro/bin
./startup.sh
