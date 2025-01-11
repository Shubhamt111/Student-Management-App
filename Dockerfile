# Use an official Java runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the application JAR file to the container
COPY target/student-management.jar student-management.jar

# Expose port 9090 to the outside world
EXPOSE 9090

# Run the application
ENTRYPOINT ["java", "-jar", "student-management.jar"]