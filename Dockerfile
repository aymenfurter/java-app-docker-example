FROM openjdk:8-alpine

COPY java-app.zip /tmp/my-java-app.zip

RUN cd tmp \ 
    && unzip -q /tmp/my-java-app.zip \
    && rm /tmp/my-java-app.zip \
    && mkdir -p /opt/ \
    && mv /tmp/my-java-app/ /opt/my-java-app 

RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser 

USER appuser

EXPOSE 1234

ENTRYPOINT ["/opt/my-java-app/bin/start.sh"] 
