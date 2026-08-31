# 🚀 Antigravity IDE - Paquete de Sincronización y Configuración

Este repositorio contiene la configuración unificada de **Google Antigravity IDE** para trabajar de forma idéntica en cualquier equipo.

---

## 📦 ¿Qué incluye este paquete?

1. **25 Agent Skills de Addy Osmani:**
   - Metodologías avanzadas (`spec-driven-development`, `test-driven-development`, `security-and-hardening`, `code-review-and-quality`, etc.).
2. **Servidores MCP (Model Context Protocol):**
   - 🌐 `Chrome DevTools` (automatización y pruebas de navegador real).
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

---

## ⚡ Cómo configurar un ordenador nuevo (en 1 solo paso)

1. Clona este repositorio o copia estos archivos en el nuevo equipo.
2. Haz **doble clic en `configurar_antigravity.bat`** (o ejecuta `configurar_antigravity.ps1` con PowerShell).
3. ¡Listo! El script detectará automáticamente tu nombre de usuario, instalará las dependencias y dejará Antigravity configurado al 100%.
