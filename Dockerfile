FROM openjdk:8-alpine

COPY my-java-app.zip /tmp/my-java-app.zip

RUN apk add --update bash && rm -rf /var/cache/apk/*

RUN mkdir /opt \
    && cd /opt \
    && cp /tmp/my-java-app.zip /opt/my-java-app.zip \
    && unzip /opt/my-java-app.zip \
    && rm /opt/my-java-app.zip \
    && addgroup -S app && adduser -S -G app app \
    && chown -R app /opt/my-java-app/ \
    && chmod +x /opt/my-java-app/bin/start.sh

USER app

EXPOSE 1234

ENTRYPOINT "/opt/my-java-app/bin/start.sh"

