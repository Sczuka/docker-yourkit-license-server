FROM adoptopenjdk/openjdk8:alpine-slim

ARG LICENSE_SERVER_VERSION=2019-01-14
ARG LICENSE_SERVER_LOCATION=/opt/yourkit/license-server

RUN curl -O /tmp/yourkit-license-server.zip https://www.yourkit.com/download/yourkit-license-server-unix-${LICENSE_SERVER_VERSION}.zip && \
  mkdir -p /opt/yourkit/license-server && \
  unzip /tmp/yourkit-license-server.zip -d ${LICENSE_SERVER_LOCATION} && \
  rm -f /tmp/yourkit-license-server.zip
  
 VOLUME ["${LICENSE_SERVER_LOCATION}/licenses"]
  
 ENTRYPOINT [ "${LICENSE_SERVER_LOCATION}/bin/startup.sh" ]
