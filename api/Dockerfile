# Usa una imagen de Java como base
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos de tu aplicación al contenedor
COPY target/classes /app/classes

# Establece la variable de entorno para la codificación de archivos
ENV LANG C.UTF-8

# Ejecuta la aplicación Spring Boot
CMD ["java", "-classpath", "/app/classes", "com.mare.api.ApiApplication"]



