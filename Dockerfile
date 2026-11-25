
# Stage 1: Maven build
FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

# Stage 2: Tomcat runtime
FROM tomcat:10.1-jdk17-temurin

COPY --from=build /app/target/AI-OLMS.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
