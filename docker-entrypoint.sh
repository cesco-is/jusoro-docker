#!/bin/bash
if [ "$(ls -A /jusoro-app/jusoro)" ]; then
  echo "jusoro-app Directory already."
else
  echo "jusoro-app Directory do not exist" ;
  mkdir -p /jusoro-app
  cd /apptemp
  mv ./jusoro /jusoro-app
  chmod -R 755 /jusoro-app
  cd /
fi

if [ "$(ls -A /apptemp)" ]; then
  echo "apptemp Directory already."
  rm -rf /apptemp
else
  echo "apptemp Directory do not exist"
fi

echo 'start jusoro app'
cd /jusoro-app/jusoro/bin
./startup.sh
