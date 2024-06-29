# Stage 1: Build the application
FROM maven:3.8.1-jdk-11 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml file and the source code into the container
COPY . .
#COPY src ./src

# Package the application
RUN mvn clean package 
#-DskipTests

# Stage 2: Run the application
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the jar file from the build stage to the run stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port the application runs on
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java","-Dspring.profiles.active=prod", "-jar", "app.jar"]