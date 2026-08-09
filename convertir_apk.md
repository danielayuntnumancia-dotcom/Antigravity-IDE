---
description: Guía y automatiza la conversión de un proyecto web a APK de Android con Capacitor, adaptando UI y configurando autenticación nativa.
---

Pasos de ejecución del Workflow:

Ejecuta secuencialmente las siguientes fases. Si algún paso falla, detente y avísame del error. Detente y espera confirmación siempre que haya una tarea manual para el usuario.

Fase 1: Inicialización y Dependencias (Automático)
1. Verifica el entorno del proyecto actual.
2. Ejecuta `npm install @capacitor/core` y `npm install -D @capacitor/cli` en la terminal integrada.
3. Solicita al usuario el Nombre de la Aplicación y el Identificador de Paquete (ej. com.ayuntnumancia.app) si no puedes deducirlo del proyecto.
4. Ejecuta `npx cap init "[Nombre]" "[Paquete]" --web-dir dist` (o el directorio de build correspondiente).
5. Ejecuta `npm install @capacitor/android` y, tras ello, `npx cap add android`.

Fase 2: Configuración de Autenticación Nativa Firebase (Automático)
1. Ejecuta `npm install @capacitor-firebase/authentication`.
2. Modifica el código de autenticación (ej. AuthContext.tsx) para importar `Capacitor.isNativePlatform()` y bifurcar el inicio de sesión: usar redirección/método nativo en móvil y popup en web.
3. Actualiza `capacitor.config.ts` añadiendo los proveedores, por ejemplo: providers: ["google.com"].
4. Modifica `android/variables.gradle` para incluir `rgcfaIncludeGoogle = true`.

Fase 3: Adaptación UI/UX para Móviles (Automático)
1. Identifica menús desplegables basados en hover y conviértelos a eventos onClick (táctiles).
2. Reorganiza la barra de navegación inferior, limitándola a un máximo de 5 elementos prioritarios (trasladando el resto a menús secundarios).
3. Ejecuta `npm run build` y luego `npx cap sync`.

Fase 4: Guía de Tareas Manuales (Interactivo)
Detén la ejecución automática en este punto. Proporciona al usuario el siguiente listado de acciones en el chat y dile explícitamente que responda "Hecho" cuando las haya completado:
- "Abre Android Studio y selecciona la carpeta `android` generada en tu proyecto. Si pide versión de Java, usa JVM 21."
- "Extrae tu clave SHA-1: Ve a la pestaña Terminal de Android Studio, ejecuta `.\gradlew signingReport` y copia el código al lado de SHA1: en el bloque Variant: debug."
- "En Firebase Console, ve a Autenticación > Configuración > Dominios autorizados y añade `localhost`."
- "En Ajustes del proyecto de Firebase, añade una app de Android con tu paquete y SHA-1. Descarga el `google-services.json` y colócalo exactamente en `android/app/`."

Fase 5: Compilación Final (Instrucción)
Una vez el usuario responda confirmando el paso anterior, indícale los pasos finales:
1. "En Android Studio, haz clic en File > Sync Project with Gradle Files."
2. "Ve a Build > Build Bundle(s) / APK(s) > Build APK(s) para generar tu instalador definitivo."