FROM adoptopenjdk/openjdk8:alpine-slim

ARG LICENSE_SERVER_VERSION=2019-01-14
ARG LICENSE_SERVER_LOCATION=/opt/yourkit/license-server

ENV LICENSE_SERVER_LOCATION=${LICENSE_SERVER_LOCATION}

RUN apk --no-cache add curl unzip && \
  curl -o /tmp/yourkit-license-server.zip https://www.yourkit.com/download/yourkit-license-server-unix-${LICENSE_SERVER_VERSION}.zip && \
  mkdir -p ${LICENSE_SERVER_LOCATION} && \
  unzip /tmp/yourkit-license-server.zip -d /opt/yourkit/license-server && \
  rm -f /tmp/yourkit-license-server.zip && \
  apk --no-cache del curl unzip
  
EXPOSE 10112
  
VOLUME ["${LICENSE_SERVER_LOCATION}/licenses"]
  
ENTRYPOINT [ "${LICENSE_SERVER_LOCATION}/bin/startup.sh" ]
