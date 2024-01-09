#!/bin/bash
WAIT="${WAIT:-12h}"
MAX_FILES="${MAX_FILES:6}"
while true; do
  echo "$(date --iso=seconds) | starting backup"
  tar -zcvf /output/backup_$(date "+%Y-%m-%d_%H-%M-%S").tar.gz /input/
#  smbclient //192.168.86.100/Drive -U '***@***' -c 'cd Backup/smarthome ; ls ; put aaa aaa'
  echo "$(date --iso=seconds) | backup finished, waiting for: $WAIT"

  cd /output
  echo "Removing redundant files..."
  ls -t | awk "NR>$MAX_FILES"
  rm $(ls -t | awk "NR>$MAX_FILES")
  sleep "$WAIT"
done
