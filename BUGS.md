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

## 2) ~~POST a /verifyLogin ignora el body~~ `[CERRADO]`

- **Título:** POST /verifyLogin retorna `responseCode 400` aunque se envíe body con credenciales válidas
- **Archivo:** [src/test/java/examples/products/products-post.feature](src/test/java/examples/products/products-post.feature#L21-L23)
- **Estado:** ✅ CERRADO — No era bug del servidor, era un error en cómo se enviaba el request.
- **Causa raíz:** El endpoint `/verifyLogin` requiere `form-data` (`x-www-form-urlencoded`), no `application/json`. Al enviar como JSON el servidor no leía los parámetros y respondía 400. Adicionalmente, durante la investigación el campo `password` no fue incluido en el form.
- **Resolución:** Al enviar `email` y `password` correctamente como `form-data` con ambos campos y credenciales válidas, el servidor respondió satisfactoriamente y el usuario fue encontrado.
- **Fix en Karate:** usar `form fields` en lugar de `request` en el feature:
  ```gherkin
  And form fields { email: 'usuario@mail.com', password: 'contraseña' }
  ```
- **Ver también:** [docs/API_NOTES.md](docs/API_NOTES.md) — sección `/verifyLogin`.

---
