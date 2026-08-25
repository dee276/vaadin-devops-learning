# Vaadin DevOps Learning

A minimal Vaadin and Spring Boot application used to learn a complete DevOps and CI/CD workflow one step at a time.

## Current milestone

Step 1: run a small Vaadin application locally and manage its source code with Git.

The home page displays three simple values:

- application status;
- current environment;
- application version.

## Requirements

- Java 25
- Git

Maven does not need to be installed globally. The project includes the Maven Wrapper, which downloads and uses the expected Maven version.

## Run locally

On Windows PowerShell:

```powershell
.\mvnw.cmd spring-boot:run
```

The `spring-boot:run` Maven goal compiles the application and starts its embedded web server. Open http://localhost:8080 after startup.

Stop the server with `Ctrl+C` in the terminal.

## Run the tests

```powershell
.\mvnw.cmd clean test
```

`clean` removes the previous Maven build directory (`target/`). `test` compiles the application and runs its automated tests.

## Project structure

```text
src/main/java/         Java application and Vaadin views
src/main/resources/    Spring configuration and application styles
src/test/java/         Automated tests
pom.xml                Maven project and dependency configuration
mvnw / mvnw.cmd        Maven Wrapper launchers
```

Containerization will be introduced separately in step 2.
