# Establecer la imagen base con el JDK de Java
FROM openjdk:19-jdk-alpine3.16 AS build

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

ARG URL1=''
ARG URL2=''
ARG URL3=''

# Copiar los archivos de configuración
COPY .mvn/ .mvn/
COPY mvnw .
COPY pom.xml .

# Copiar el código fuente
COPY src/ src/


# Descargar las dependencias del proyecto y compilar la aplicación
RUN chmod +x mvnw
RUN ./mvnw package -DskipTests


#Establecer la imagen base para la ejecución
FROM openjdk:8u212-jre-alpine3.9

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo JAR de la etapa de construcción
COPY --from=build /app/target/orders-service-example-0.0.1-SNAPSHOT.jar .

# Establecer el comando de inicio de la aplicación

#CMD java -jar orders-service-example-0.0.1-SNAPSHOT.jar --server.port=80 $APP_ARGS

CMD java -jar orders-service-example-0.0.1-SNAPSHOT.jar $URL1 $URL2 $URL3 --server.port=$SERVER_PORT
#http://lb-payments-service-dev-1698851145.us-east-1.elb.amazonaws.com http://lb-products-service-dev-1861504078.us-east-1.elb.amazonaws.com http://lb-shipping-service-dev-1453016572.us-east-1.elb.amazonaws.com --server.port=80

#CMD java -jar orders-service-example-0.0.1-SNAPSHOT.jar $APP_ARGS
