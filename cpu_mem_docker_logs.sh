#!/bin/bash

container_ids=$(docker ps --format '{{.ID}}')

(timeout 20m docker stats --format \
  'CPU: {{.CPUPerc}}\tMEM: {{.MemPerc}}' $container_ids \
  | sed 's/\x1b\[[0-9;]*[a-zA-Z]//g' ; echo) \
  | gzip -c > monitor.log.gz
