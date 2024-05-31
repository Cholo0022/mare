# Usa una imagen base de OpenJDK como base
FROM openjdk:17

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR empaquetado en la imagen
COPY target/api-0.0.1-SNAPSHOT.jar /app/api-0.0.1-SNAPSHOT.jar

# Expone el puerto en el que tu aplicación escucha (si es necesario)
EXPOSE 8080

# Comando para ejecutar la aplicación cuando el contenedor se inicia
CMD ["java", "-jar", "api-0.0.1-SNAPSHOT.jar"]




