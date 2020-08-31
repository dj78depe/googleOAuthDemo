# ------------- SIMPLE ONE without MVN CLEAN INSTALL ------------- #

# FROM openjdk:8
# VOLUME /tmp
# ADD target/GoogleOAuthDemo-0.0.1-SNAPSHOT.jar GoogleOAuthDemo.jar
# ENTRYPOINT ["java", "-jar", "/GoogleOAuthDemo.jar"]


# ------------- ONE with MVN CLEAN INSTALL ------------- #

# ------------- builder ------------- #
FROM openjdk:11.0.3-jdk-slim-stretch as builder

ARG MAVEN_VERSION=3.3.9-4
ARG USER_HOME_DIR="/root"

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
ENV SPRING_PROFILES_ACTIVE="True"

# speed up Maven JVM a bit
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"


RUN mkdir -p /usr/share/man/man1

RUN apt update
RUN apt-get install -y maven=${MAVEN_VERSION}
RUN mvn --version

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . .

RUN mvn -T 1C clean install
RUN ls -la target

RUN echo "Finished building targets"

# ------------- runner ------------- #

FROM openjdk:11.0.3-jdk-slim-stretch as runner

WORKDIR /usr/src/app

RUN apt-get update -y
RUN apt-get install -y curl

# Remove apt cache to make the image smaller
RUN rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/src/app/target .
RUN ls -la
ENV SPRING_PROFILES_ACTIVE="docker"

ENTRYPOINT [ "java", "-Dspring.profiles.active=docker", "-jar", "GoogleOAuthDemo-0.0.1-SNAPSHOT.jar"]
