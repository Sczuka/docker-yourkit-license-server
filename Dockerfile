FROM eclipse-temurin:11-jre-alpine

ARG LICENSE_SERVER_VERSION=2023.5-b227

https://download.yourkit.com/ls/yourkit-license-server-unix-.zip

RUN apk --no-cache add curl unzip && \
  curl -o /tmp/yourkit-license-server.zip https://download.yourkit.com/ls/yourkit-license-server-unix-${LICENSE_SERVER_VERSION}.zip && \
  mkdir -p /opt/yourkit && \
  unzip /tmp/yourkit-license-server.zip -d /opt/yourkit/ && \
  rm -f /tmp/yourkit-license-server.zip && \
  apk --no-cache del curl unzip

EXPOSE 10112
  
VOLUME ["/opt/yourkit/yourkit-license-server/licenses"]

WORKDIR /opt/yourkit/yourkit-license-server/bin/

ENTRYPOINT [ "/opt/yourkit/yourkit-license-server/bin/startup.sh" ]
