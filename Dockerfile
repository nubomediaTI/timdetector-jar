FROM nubomedia/apps-baseimage:src

MAINTAINER Nubomedia

RUN mkdir /tmp/call-on-detect
ADD call_on_detect-6.1.0.jar /tmp/call-on-detect/
ADD keystore.jks /

EXPOSE 8450

ENTRYPOINT java -jar /tmp/call-on-detect/call_on_detect-6.1.0.jar
