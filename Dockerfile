FROM openjdk:11

ARG  SFDBUNAME
ARG  SFDBPWD

LABEL maintainer="roundtable"

RUN microdnf install findutils

COPY . /ghaction
WORKDIR /ghaction

RUN ./gradlew build -x test

EXPOSE 8080

CMD ["java", "-jar", "/ghaction/build/libs/ghaction-0.0.1-SNAPSHOT.jar", "-DUSER="${SFDBUNAME}, "-DPASSWORD="${SFDBPWD}]