FROM java:8
RUN apt-get update
RUN apt-get install -y maven
WORKDIR .
ADD pom.xml ./pom.xml
ADD src /src
RUN ["mvn", "package"]
EXPOSE 8080
ADD /target/samplejava-1.0.0.war samplejava-1.0.0.war
ENTRYPOINT ["java", "-jar", "samplejava-1.0.0.war"]
