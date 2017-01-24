FROM nubomedia/apps-baseimage:src

MAINTAINER Nubomedia

#RUN sudo apk --update add redis=3.0.5-r1

ADD startup.sh /

ADD keystore.jks /

#ADD redis.conf /

RUN mkdir /tmp/call-on-detect
ADD call_on_detect-6.1.0.jar /tmp/call-on-detect/

EXPOSE 8443

ENTRYPOINT /startup.sh
