FROM openjdk:8-jre-alpine
ENV APP_FILE spring-boot-web-app-1.0.0-SNAPSHOT.jar
ENV APP_HOME /app
COPY target/$APP_FILE $APP_HOME/
WORKDIR $APP_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["exec java -jar $APP_FILE"]