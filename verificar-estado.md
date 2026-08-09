---
description: Comprueba si los archivos locales son anteriores o posteriores al repositorio de GitHub sin modificarlos, evitando sobrescribir código al trabajar en distintos equipos.
---

Pasos de ejecución del Workflow:

Ejecuta secuencialmente las siguientes acciones en la terminal integrada. No modifiques ni fusiones archivos automáticamente. Si algún paso falla, detente y avísame del error.

1. Ejecuta `git branch --show-current` para identificar en qué rama estamos trabajando.
2. Ejecuta `git fetch` para descargar el historial y los cambios más recientes de GitHub de forma segura (sin fusionarlos con tus archivos locales).
3. Ejecuta `git status` para comprobar el estado de los archivos locales y la posición de la rama local respecto a la remota.
4. Ejecuta `git log --oneline HEAD..@{u}` para ver si existen commits en GitHub que falten en tu equipo local.
5. Analiza la salida de los comandos anteriores y genérame un reporte claro y directo con el siguiente formato:
   * **Estado del Repositorio:** Indica claramente si mis archivos son ANTERIORES, POSTERIORES, EXACTAMENTE IGUALES, o si han DIVERGIDO respecto a GitHub.
   * **Diagnóstico y Acción Recomendada:** 
     - Si está "behind" (atrás): Alértame de que GitHub tiene código más nuevo. Sugiéreme revisar los cambios o usar `git pull`.
     - Si está "ahead" (adelante): Confírmame que mis archivos locales son los más recientes y es seguro hacer `git push`.
     - Si ha "diverged" (divergido): Alértame de que hay cambios nuevos tanto en local como en GitHub. Sugiéreme hacer `git pull` con cuidado para resolver conflictos.
     - Si está "up to date": Confirma que todo está sincronizado.
6. Enumera brevemente los archivos locales que tengan modificaciones sin guardar (uncommitted changes), si los hay, para saber qué estoy a punto de mezclar.