
---

# Proyecto de Pruebas Automatizadas con Robot Framework

Este proyecto contiene pruebas automatizadas desarrolladas en **Robot Framework** para aplicaciones web y móviles. Utiliza la **SeleniumLibrary** para pruebas en aplicaciones web y la **AppiumLibrary** para pruebas en aplicaciones móviles.

## Requisitos

Para ejecutar este proyecto, asegúrate de tener los siguientes requisitos:

- **Python** 3.7+
- **Robot Framework** (`pip install robotframework`)
- **SeleniumLibrary** (`pip install robotframework-seleniumlibrary`)
- **AppiumLibrary** (`pip install robotframework-appiumlibrary`)
- **Appium Server** para pruebas móviles (configurado y corriendo)
- **WebDriver** para el navegador específico (por ejemplo, ChromeDriver para Chrome)
- **Configuración de variables** para URL, credenciales y otras configuraciones específicas de la aplicación (detalles en `*/variables_sets.resource`)

## Instalación

1. **Clona este repositorio**:

   ```bash
   git clone https://github.com/tu-usuario/tu-proyecto.git
   cd tu-proyecto
   ```

2. **Instala las dependencias**:

   ```bash
   pip install -r requirements.txt
   ```

   El archivo `requirements.txt` debe incluir al menos:

   ```txt
   robotframework
   robotframework-seleniumlibrary
   robotframework-appiumlibrary
   ```

3. **Configura el Appium Server** si deseas ejecutar pruebas en dispositivos móviles. Asegúrate de que el servidor esté activo y configurado para reconocer los dispositivos.

## Estructura del Proyecto

- **cases/**: Contiene las pruebas testcases por módulos o funcionalidades.
- **keywords/**: Contiene palabras clave personalizadas para reutilización y organización de código.
- **resources/**: Incluye archivos de recursos (e.g., `variables.robot`, `settings.robot`) y configuraciones adicionales.
- **results/**: Almacena los resultados de cada ejecución de prueba (logs y reportes de salida).

## Ejecución de Pruebas

### Pruebas Web

Para ejecutar pruebas en una aplicación web utilizando **SeleniumLibrary**:

```bash
robot -d results/ module/name_module/cases/name.robot
```

### Pruebas Móviles

Para ejecutar pruebas en una aplicación móvil utilizando **AppiumLibrary**:

1. Asegúrate de que **Appium Server** esté activo.
2. Ejecuta las pruebas:

   ```bash
   robot -d results module/name_mobile_module/cases/name.robot
   ```

### Ejecución Completa

Para ejecutar todas las pruebas (web y móviles):

```bash
robot -d reports tests/
```

Para ejecutar todo en paralelo, debes instalar PABOT

```bash
pabot -d reports module/
```

## Configuración

Algunas configuraciones específicas, como la URL de la aplicación, credenciales o dispositivos, se encuentran en `common_helpers`. Modifica estos valores de acuerdo a tus necesidades antes de ejecutar las pruebas.

## Reportes

Los reportes de ejecución se generan en la carpeta `results/` y contienen:

- **output.xml**: Salida en formato XML para análisis detallado.
- **log.html**: Registro detallado de la ejecución de las pruebas.
- **report.html**: Resumen de la ejecución de las pruebas.

## Contribución

Si deseas contribuir al proyecto, sigue estos pasos:

1. Realiza un fork del repositorio.
2. Crea una rama con tus cambios: `git checkout -b feature/nombre-rama-efimera`.
3. Haz commit de tus cambios: `git commit -m 'Descripción de cambios'`.
4. Haz push a la rama: `git push origin feature/nombre-rama-efimera`.
5. Abre un Pull Request para aprobación y luego merge a rama "main"

## Contacto

Para preguntas o soporte, contacta a [mpuertao@gmail.com].

