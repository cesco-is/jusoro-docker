#!/bin/bash
if [ "$(ls -A /jusoro-app/jusoro)" ]; then
  echo "Directory already."
else
  echo "Directory do not exist" ;
  mkdir -p /jusoro-app
  cd /apptemp
  mv ./jusoro /jusoro-app
  chmod -R 755 /jusoro-app
  cd /
  rm -rf /apptemp
fi

echo 'start -'
cd /jusoro-app/jusoro/bin
./startup.sh
