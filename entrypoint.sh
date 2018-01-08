#!/bin/bash
if [[ "$1" = *aptly ]]; then
  if [ -d /repo ] && [ `stat -c%u /repo` -eq 0 ]; then
    chown aptly.aptly /repo
  fi
  exec gosu aptly "$@"
else
  exec "$@"
fi
