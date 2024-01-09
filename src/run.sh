#!/bin/bash
WAIT="${WAIT:-12h}"
MAX_FILES="${MAX_FILES:-6}"
while true; do
  echo "$(date --iso=seconds) | starting backup"
  tar -zcvf /output/backup_$(date "+%Y-%m-%d_%H-%M-%S").tar.gz /input/
#  smbclient //192.168.86.100/Drive -U '***@***' -c 'cd Backup/smarthome ; ls ; put aaa aaa'
  echo "$(date --iso=seconds) | backup finished"

  cd /output
  echo "$(date --iso=seconds) | removing redundant files..."
  ls -tp | grep -v '/$' | tail -n +$MAX_FILES
  ls -tp | grep -v '/$' | tail -n +$MAX_FILES | xargs -I {} rm -- {}

  echo "$(date --iso=seconds) | removing redundant files finished, waiting for: $WAIT"
  sleep "$WAIT"
done
