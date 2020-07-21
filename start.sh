#!/bin/sh

h=`hostname`
# Copy appropriate conf.d files from config-map to emptyDir.
# ordinal 0 is the first host
mkdir -p /usr/local/etc/redis
if [ ! -f "$myFile" ]; then
   touch /usr/local/etc/redis/redis.conf
fi

result=$(echo $h | grep "\-0$")
if [ -n "$result" ]; then
  echo "yes"
else
  echo "slaveof redis-cluster-0.redis-cluster 6379" >> /usr/local/etc/redis/redis.conf
fi

redis-server /usr/local/etc/redis/redis.conf
