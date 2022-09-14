FROM openjdk:11

ARG  SFDBUNAME
ARG  SFDBPWD

LABEL maintainer="roundtable"

COPY . /ghaction
WORKDIR /ghaction

RUN ./gradlew build -x test
RUN echo SFDBUNAME
RUN echo SFDBPWD
EXPOSE 8080

CMD [${java_home}"/bin/java", "-jar", "/ghaction/build/libs/ghaction-0.0.1-SNAPSHOT.jar", "-DUSER="${SFDBUNAME}, "-DPASSWORD="${SFDBPWD}]