# ======= Stage 1: Build =======
FROM eclipse-temurin:21.0.5_11-jdk-ubi9-minimal AS builder

# Set the working directory
WORKDIR /app

# Copy the application source code and build it
COPY . .

# Build the JAR file using Maven (or Gradle if applicable)
RUN mvn clean package -DskipTests

# ======= Stage 2: Run =======
FROM eclipse-temurin:17-jre-alpine

# Security enhancement: Create a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set the working directory
WORKDIR /app

# Copy only the built JAR file from the build stage
COPY --from=builder /app/target/*.jar app.jar

# Set permissions for the JAR file
RUN chown appuser:appgroup /app/app.jar

# Switch to the non-root user
USER appuser

# Expose the application port
EXPOSE 7788

# Run the application with memory optimization and security flags
ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseContainerSupport", "-XX:MaxRAMPercentage=75.0", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
