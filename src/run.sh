#!/bin/bash
WAIT="${WAIT:-1h}"
while true; do
  echo "$(date --iso=seconds) | starting backup"
#  rsync -av --delete /input/ /output/
  tar -zcvf /output/backup_$(date "+%Y-%m-%d_%H-%M-%S").tar.gz /input/
  echo "$(date --iso=seconds) | backup finished, waiting for: $WAIT"
  sleep "$WAIT"
done
