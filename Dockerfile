FROM nubomedia/apps-baseimage:src

MAINTAINER Nubomedia

RUN sudo apk --update add redis=3.0.5-r1

RUN /usr/bin/redis-server

RUN mkdir /tmp/call-on-detect
ADD call_on_detect-6.1.0.jar /tmp/call-on-detect/
ADD keystore.jks /

EXPOSE 8443

ENTRYPOINT java -jar /tmp/call-on-detect/call_on_detect-6.1.0.jar
