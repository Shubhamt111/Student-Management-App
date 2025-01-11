# Use an official Java runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the application JAR file to the container
COPY target/*.jar student.jar

# Expose port 7788 to the outside world
EXPOSE 7788

# Run the application
ENTRYPOINT ["java", "-jar", "student.jar"]
