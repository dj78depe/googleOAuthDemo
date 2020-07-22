# GoogleOAuthDemo
This basic web application built using Spring Boot demonstrates Authentication and Authorization using OAuth 2.0 and OIDC standards for Single Sign On (SSO). Here the Authorization- & Request server are from Google and hence Google accounts are required to evaluate and ascertain the OAuth service.

#### Prerequisites
•   Java 1.8 – Spring Boot
•   org.apache.maven - maven.versiion - 4.0.X
•   Google Account
•   Docker

#### Building Project

Once the project is imported as Maven Project in an IDE having the prerequisites, look for file: **pom.xml**. Dependencies are configured here. Any updates with versions or dependencies must be updated here.

The project has to be updated first to DOWNLOAD THE DEPENDENCIES. 
For this, follow below steps in order:

•   project -> Maven -> Update Project

To CLEAN the project, follow:

•   project -> Run As -> Maven clean

To BUILD and INSTALL the project, follow:

•   project -> Run As -> Maven install


To RUN the project as STANDALONE as a jar, follow:
Upon successful installation of Maven without compilation errors, then ideally the project must be encapsulated as a jar. To run as a jar (from command line), use command: 
•   java -jar  GoogleOAuthDemo-0.0.1-SNAPSHOT.jar

This jar with the name **GoogleOAuthDemo-0.0.1-SNAPSHOT.jar** must be found under the  folder within the project workspace **/target**; and the application would be hosted on the machine on which it is running and under the port mentioned in **application.properties** in the ATTRIBUTE: *__server.port__*

To RUN the project as STANDALONE in IDE, follow: 
run the main class **GoogleOAuthDemoApplication.java** as a java application and the application would be hosted on the machine it is running and under the port mentioned in **application.properties** in the ATTRIBUTE: *__server.port__*

To RUN the project as DOCKER, follow:
``` cd /googleOAuthDemo ``` (project directory where Dockerfile resides)
``` docker build -t <preferred-imageName> . ```
``` docker run -p 4000:8080 <taggedImageName> ``` (where 4000 is the port of the machine where Docker is hosted and 8080 is the port of the SSO web application. In other words web app can be accessed via 4000 port.)

#### URL Mapping - /public & /restricted
* **http://localhost:<port>/public** would return the real time Date/Time of the machine without need of authorization
* **http://localhost:<port>/restricted** would return the User Name, Profile Picture, Email address of the logged in Google user upon successful authorization by Google server.
