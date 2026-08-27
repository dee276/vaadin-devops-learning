FROM eclipse-temurin:25-jdk-noble AS build

WORKDIR /app

COPY .mvn/ .mvn/
COPY mvnw pom.xml ./

RUN sed -i 's/\r$//' mvnw && chmod +x mvnw
RUN ./mvnw -B dependency:go-offline

COPY src/ src/

RUN ./mvnw -B clean package

FROM eclipse-temurin:25-jre-noble AS runtime

WORKDIR /app

COPY --from=build /app/target/app-1.0-SNAPSHOT.jar app.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "app.jar"]