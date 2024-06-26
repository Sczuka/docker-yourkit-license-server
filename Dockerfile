FROM adoptopenjdk/openjdk8:alpine-slim

ARG LICENSE_SERVER_VERSION=2019-01-14

RUN apk --no-cache add curl unzip && \
  curl -o /tmp/yourkit-license-server.zip https://www.yourkit.com/download/yourkit-license-server-unix-${LICENSE_SERVER_VERSION}.zip && \
  mkdir -p /opt/yourkit && \
  unzip /tmp/yourkit-license-server.zip -d /opt/yourkit/ && \
  rm -f /tmp/yourkit-license-server.zip && \
  apk --no-cache del curl unzip

EXPOSE 10112
  
VOLUME ["/opt/yourkit/yourkit-license-server/licenses"]

WORKDIR /opt/yourkit/yourkit-license-server/bin/

ENTRYPOINT [ "/opt/yourkit/yourkit-license-server/bin/startup.sh" ]
