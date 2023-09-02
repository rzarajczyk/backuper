#!/bin/bash
WAIT="${WAIT:-1h}"
while true; do
  echo "$(date --iso=seconds) | starting backup"
  tar -zcvf /output/backup_$(date "+%Y-%m-%d_%H-%M-%S").tar.gz /input/
#  smbclient //192.168.86.100/Drive -U '***@***' -c 'cd Backup/smarthome ; ls ; put aaa aaa'
  echo "$(date --iso=seconds) | backup finished, waiting for: $WAIT"
  sleep "$WAIT"
done
