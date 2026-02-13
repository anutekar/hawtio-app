FROM eclipse-temurin:17-jre-alpine

ENV HAWTIO_VERSION=4.4.0
ENV HAWTIO_HOME=/opt/hawtio

RUN apk add --no-cache curl \
 && mkdir -p ${HAWTIO_HOME}

# Download latest hawtio WAR
RUN curl -L https://repo1.maven.org/maven2/io/hawt/hawtio-app/${HAWTIO_VERSION}/hawtio-app-${HAWTIO_VERSION}.war -o ${HAWTIO_HOME}/hawtio.war

WORKDIR ${HAWTIO_HOME}

EXPOSE 8080

CMD ["java","-jar","hawtio.war"]
