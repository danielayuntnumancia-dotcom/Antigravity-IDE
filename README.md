# 🚀 Antigravity IDE - Sincronización y Configuración Multi-Equipo

Este repositorio contiene la configuración unificada de **Google Antigravity IDE** para trabajar de forma idéntica en cualquier ordenador.

---

## ⚡ Instalación en 1 Clic (1 Solo Archivo)

Para configurar cualquier ordenador nuevo:

1. **Descarga únicamente el archivo [`configurar_antigravity.bat`](https://raw.githubusercontent.com/danielayuntnumancia-dotcom/Antigravity-IDE/main/configurar_antigravity.bat)** (o guárdalo en tu pendrive/nube).
2. Haz **doble clic en `configurar_antigravity.bat`**.
3. ¡Listo! En menos de 40 segundos, el script detectará tu usuario, instalará las dependencias y dejará Antigravity configurado al 100%.

---

## 📦 ¿Qué instala y configura automáticamente?

1. **25 Agent Skills de Addy Osmani:**
   - Metodologías (`spec-driven-development`, `test-driven-development`, `security-and-hardening`, `code-review-and-quality`, `incremental-implementation`, etc.).
2. **Servidores MCP (Model Context Protocol):**
   - 🌐 `Chrome DevTools` (automatización y pruebas de navegador).
   - 🐙 `GitHub MCP` (gestión de repositorios).
   - 🎨 `Figma MCP` (lectura de diseños).
3. **Herramientas Globales:**
   - 🔥 `firebase-tools` (Firebase CLI para Auth, Firestore y Hosting).
   - 📱 `@capacitor/cli` (para compilar a Android APK nativo).
4. **Estándares de Diseño y UI:**
   - Regla obligatoria de componentes **`shadcn/ui`** y catálogo de iconos **`lucide-react`**.
5. **Workflows y Comandos Slash (`/`):**
   - `/sincronizar` (descarga cambios de GitHub y dependencias).
   - `/terminar` (guarda todo en GitHub y despliega en Firebase).
   - `/convertir_apk` (convierte la app web a Android APK).
   - `/verificar-estado` (comprueba versiones sin tocar código).
