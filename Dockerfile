FROM openjdk:8
VOLUME /tmp
ADD target/GoogleOAuthDemo-0.0.1-SNAPSHOT.jar GoogleOAuthDemo.jar
ENTRYPOINT ["java", "-jar", "/GoogleOAuthDemo.jar"]
