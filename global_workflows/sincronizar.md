---
description: Sincroniza el repositorio local con GitHub, actualiza dependencias y verifica el entorno activo.
---

Pasos de ejecución del Workflow:

Ejecuta secuencialmente las siguientes acciones en la terminal integrada. Si algún paso falla, detente y avísame del error.

1. Ejecuta `git status` para comprobar si hay cambios sin guardar y verificar la rama activa.
2. Ejecuta `git fetch` y luego `git pull` para descargar y aplicar las últimas actualizaciones del repositorio remoto.
3. Ejecuta `git remote -v` para confirmar visualmente a qué repositorio de GitHub estamos conectados.
4. Si detectas un archivo `package.json` en la raíz, ejecuta `npm install` para sincronizar las dependencias que hayan podido cambiar en el otro equipo.
5. Ejecuta `firebase use` o lee el archivo `.firebaserc` para confirmar el alias del proyecto de Firebase activo.
6. Genera un reporte final en el chat que diga exactamente: "Sincronización completada con éxito. Rama actual: [Nombre de la rama]. Repositorio: [Nombre del repo]. Firebase activo: [ID de Firebase]. Entorno seguro y listo para trabajar."
7. Busca en la raíz del proyecto un archivo llamado `ESTADO_PROYECTO.md`. Si existe, léelo y hazme un breve resumen en el chat diciéndome: "Bienvenido de nuevo. Según nuestras últimas notas, esto es lo que nos quedó pendiente: [Resumen de tareas]".