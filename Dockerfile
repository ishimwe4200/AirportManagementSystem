# ─────────────────────────────────────────────────────────────────────────────
# Stage 1: Build — compile the Java source code
# ─────────────────────────────────────────────────────────────────────────────
FROM eclipse-temurin:21-jdk-alpine AS builder

WORKDIR /app

# Copy all source files
COPY src/ ./src/

# Compile all sources (main class pulls in all dependencies via -sourcepath)
RUN mkdir -p out && \
    javac -d out -sourcepath src \
        src/system/AirportSystem.java \
        src/staff/Pilot.java \
        src/staff/CabinCrew.java \
        src/staff/GroundStaff.java \
        src/staff/SecurityOfficer.java \
        src/staff/MaintenanceStaff.java \
        src/airport/Airport.java \
        src/airport/Terminal.java \
        src/airport/Gate.java \
        src/operations/Schedule.java \
        src/operations/Notification.java

# Package into an executable JAR
RUN echo "Manifest-Version: 1.0\nMain-Class: system.AirportSystem\n" > MANIFEST.MF && \
    jar --create --file AirportManagementSystem.jar \
        --manifest MANIFEST.MF \
        -C out .

# ─────────────────────────────────────────────────────────────────────────────
# Stage 2: Run — minimal JRE image
# ─────────────────────────────────────────────────────────────────────────────
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copy only the JAR from the build stage
COPY --from=builder /app/AirportManagementSystem.jar .

# Metadata
LABEL maintainer="Group D - Sunday"
LABEL description="Advanced Airport Management System - OOP Java Assignment"
LABEL version="1.0.0"

# Run the application
# -i keeps stdin open so the interactive menu works
ENTRYPOINT ["java", "-jar", "AirportManagementSystem.jar"]
