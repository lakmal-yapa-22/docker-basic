FROM openjdk:17-jdk-slim

WORKDIR /app


#copy compiled JAR file into the container at /app
#copy target/Docker-0.0.1-SNAPSHOT.jar

COPY target/*.jar app.jar

EXPOSE 8080

#run the JAR file
#java -jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
