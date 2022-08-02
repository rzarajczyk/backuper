#!/bin/bash
WAIT="${WAIT:-1h}"
while true; do
  echo "Starting rsync"
  rsync -av --delete /input/ /output/
  echo "rsync finished, waiting for: $WAIT"
  sleep "$WAIT"
done
