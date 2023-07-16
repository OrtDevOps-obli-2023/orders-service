# Establecer la imagen base con el JDK de Java
FROM openjdk:19-jdk-alpine3.16 AS build

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

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

#--server.port=$SERVER_PORT

CMD java -jar orders-service-example-0.0.1-SNAPSHOT.jar $APP_ARGS
