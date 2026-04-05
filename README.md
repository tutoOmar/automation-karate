# Karate Learning

Proyecto de pruebas automatizadas de API usando [Karate](https://karatelabs.github.io/karate/).

## Requisitos

- Java 21+
- Maven 3.9+

## Estructura

```
src/test/java/
  tests/
    TestsTest.java          # Runner principal (paralelo)
    products/
      ProductsRunner.java   # Runner individual
      *.feature             # Escenarios de prueba
```

## Ejecutar pruebas

```bash
# Todas las pruebas
mvn clean test

# Un feature específico
mvn test -Dtest=ProductsRunner#getMethods
```

## Reportes

Después de ejecutar, los reportes HTML están en:
```
target/karate-reports/karate-summary.html
```
