# BUGS

## 1) POST en /productsList retorna 200 en lugar de 405

- **Título:** POST en /productsList retorna 200 en lugar de 405
- **Archivo:** [src/test/java/examples/products/products-post.feature](src/test/java/examples/products/products-post.feature#L7)
- **Descripción:** Según la documentación, el endpoint `/productsList` no admite el método POST. La prueba automática del proyecto realiza un `POST` y el servidor responde con `200 OK` en lugar de `405 Method Not Allowed`.
- **Pasos para reproducir:**
  1. Ejecutar el escenario en el archivo indicado.
  2. Hacer POST a `/productsList` sin body.
- **Resultado actual:** 200 OK
- **Resultado esperado:** 405 Method Not Allowed
- **Notas:** El escenario problemático está en la línea indicada del archivo de pruebas; revisar implementación del endpoint en el servicio o reglas del reverse-proxy/API gateway.

---

