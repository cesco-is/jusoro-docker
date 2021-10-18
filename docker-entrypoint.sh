#!/bin/bash
if [ "$(ls -A /jusoro-app/jusoro)" ]; then
  echo "Directory already."
else
  echo "Directory do not exist" ;
  mkdir -p /jusoro-app
  cd /apptemp
  mv ./jusoro /jusoro-app
  chmod -R 755 /jusoro-app
fi

echo 'start -'
cd /jusoro-app/jusoro/bin
./startup.sh
