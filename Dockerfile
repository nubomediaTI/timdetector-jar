FROM nubomedia/apps-baseimage:src

MAINTAINER Nubomedia

RUN sudo apk add build-base

WORKDIR "/tmp"

RUN \
  wget http://download.redis.io/redis-stable.tar.gz && \
  tar xvzf redis-stable.tar.gz
  cd redis-stable && \
  make && \
  make install && \
  cp -f src/redis-sentinel /usr/local/bin && \
  mkdir -p /etc/redis && \
  cp -f *.conf /etc/redis && \
  rm -rf /tmp/redis-stable* && \
  sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && \
  sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf

CMD ["redis-server", "/etc/redis/redis.conf"]

RUN mkdir /tmp/call-on-detect
ADD call_on_detect-6.1.0.jar /tmp/call-on-detect/
ADD keystore.jks /

EXPOSE 8450

ENTRYPOINT java -jar /tmp/call-on-detect/call_on_detect-6.1.0.jar
