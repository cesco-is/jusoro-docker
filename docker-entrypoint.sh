#!/bin/bash
set -e

# jusoro-app 폴더 체크 및 복사
if [ ! -d "/jusoro-app/jusoro" ]; then
  echo "jusoro-app Directory does not exist. Creating..."
  mkdir -p /jusoro-app
  mv /apptemp/jusoro /jusoro-app
  chmod -R 755 /jusoro-app
else
  echo "jusoro-app Directory already exists. Skipping copy."
fi

# apptemp 정리
if [ -d "/apptemp" ]; then
  echo "Cleaning up apptemp..."
  rm -rf /apptemp
fi

# 실행
echo "Starting jusoro app..."
exec /jusoro-app/jusoro/bin/startup.sh
