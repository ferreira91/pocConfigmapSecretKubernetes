FROM openjdk:11.0.8-jdk
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","-Dspring.config.location=classpath:file:/etc/config/configmap/application.yaml, classpath:file:/etc/config/secret/application.yaml","/app.jar"]
