#!/bin/bash

nohup sh -c /usr/bin/redis-server &
java -jar /tmp/call-on-detect/call_on_detect-6.1.0.jar