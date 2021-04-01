FROM adoptopenjdk/openjdk8:alpine-slim

ARG LICENSE_SERVER_VERSION=2019-01-14

RUN apk --no-cache add curl unzip && \
  curl -o /tmp/yourkit-license-server.zip https://www.yourkit.com/download/yourkit-license-server-unix-${LICENSE_SERVER_VERSION}.zip && \
  mkdir -p /opt/yourkit/license-server && \
  unzip /tmp/yourkit-license-server.zip -d /opt/yourkit/license-server && \
  rm -f /tmp/yourkit-license-server.zip && \
  apk --no-cache del curl unzip
  
EXPOSE 10112
  
VOLUME ["/opt/yourkit/license-server/licenses"]
  
ENTRYPOINT [ "/opt/yourkit/license-server/bin/startup.sh" ]
