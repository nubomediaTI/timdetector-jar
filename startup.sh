#!/bin/bash

#echo never > /sys/kernel/mm/transparent_hugepage/enabled
#nohup sh -c /usr/bin/redis-server /redis.conf &
java -jar /tmp/call-on-detect/call_on_detect-6.1.0.jar
