---
description: Guarda todo en GitHub, despliega en Firebase y genera un informe para la próxima sesión.
---

Pasos de ejecución del Workflow de Cierre:

1. Analiza el chat actual y los archivos modificados para entender qué hemos hecho en esta sesión.
2. Ejecuta `git add .` en la terminal.
3. Genera un mensaje de commit descriptivo basado en los cambios y ejecuta `git commit -m "tu mensaje aquí"`.
4. Ejecuta `git push` para subir el código al repositorio.
5. Ejecuta `firebase deploy` (recuerda la Regla Global: explícame qué vas a desplegar y pídeme confirmación con un "¿Procedo?" antes de ejecutar este paso en concreto).
6. Una vez finalizados los despliegues, redacta un informe estructurado con dos apartados: "Logros de esta sesión" y "Tareas pendientes para la próxima".
7. Escribe o sobrescribe ese informe en un archivo llamado `ESTADO_PROYECTO.md` en la raíz de la carpeta actual.
8. Despídete indicando que todo está guardado de forma segura y el entorno está listo para cerrarse.