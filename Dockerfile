FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:8
WORKDIR /app
COPY --from=build /app/target/springboot-tarun-docker.jar /app/springboot-tarun-docker.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","springboot-tarun-docker.jar"]
