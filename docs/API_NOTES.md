# API Notes — automationexercise.com

Notas de comportamiento del API descubiertas durante el desarrollo y la investigación de bugs.
Útil para el equipo: consultar antes de escribir un nuevo escenario.

---

## Base URL

```
https://automationexercise.com/api
```

---

## Endpoints

### `GET /productsList`

- Retorna la lista completa de productos.
- Responde `200 OK` con JSON.
- **Nota:** Aunque la documentación indica que no soporta `POST`, el servidor responde `200 OK` igualmente (ver [BUGS.md](../BUGS.md) — Bug 1).

---

### `GET /brandsList`

- Retorna la lista de marcas disponibles.
- Responde `200 OK` con JSON.

---

### `POST /verifyLogin`

- **Content-Type requerido:** `form-data` (`x-www-form-urlencoded`). **No acepta `application/json`.**
- **Parámetros obligatorios (form fields):**
  | Campo      | Tipo   | Requerido |
  |------------|--------|-----------|
  | `email`    | string | ✅        |
  | `password` | string | ✅        |

- **Respuestas documentadas:**
  | responseCode | Significado                                          |
  |--------------|------------------------------------------------------|
  | 200          | Credenciales válidas, usuario encontrado             |
  | 400          | Faltan parámetros `email` o `password` en el request |
  | 404          | Usuario no encontrado con esas credenciales          |

- **Ejemplo en Karate:**
  ```gherkin
  Given path '/verifyLogin'
  And form fields { email: 'usuario@mail.com', password: 'contraseña' }
  When method post
  Then status 200
  And match response.responseCode == 200
  ```

- **Hallazgo (2026-04-04):** Al enviar el body como JSON, el servidor ignora los parámetros y siempre responde `responseCode 400`. Al usar `form-data` con ambos campos y credenciales válidas, el usuario es encontrado correctamente. Ver [BUGS.md](../BUGS.md) — Bug 2 (cerrado).

---

## Notas generales

- El API utiliza una envoltura en el body con `responseCode` y `message` independiente del HTTP status code.
- El HTTP status siempre es `200 OK` en la mayoría de los endpoints incluso cuando hay error lógico — validar siempre `response.responseCode` en los assertions de Karate.
