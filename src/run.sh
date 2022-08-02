#!/bin/bash
WAIT="${WAIT:-1h}"
while true; do
  echo "$(date --iso=seconds) | starting rsync"
  rsync -av --delete /input/ /output/
  echo "$(date --iso=seconds) | rsync finished, waiting for: $WAIT"
  sleep "$WAIT"
done
