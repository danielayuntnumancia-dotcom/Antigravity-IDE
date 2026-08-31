<#
.SYNOPSIS
    Script de configuración automática de Antigravity IDE para sincronizar entornos en múltiples equipos.
.DESCRIPTION
    Instala herramientas globales de Node (Firebase y Capacitor), descarga las 25 Skills de Addy Osmani,
    configura los servidores MCP (Chrome DevTools, GitHub, Figma) y establece las reglas de diseño (shadcn/ui + Lucide).
#>

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = "Continue"

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  🚀 CONFIGURADOR AUTOMÁTICO DE ANTIGRAVITY IDE (3 EQUIPOS) " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Detectar directorio de configuración dinámico
$userConfigDir = "$env:USERPROFILE\.gemini\config"
$skillsDir = "$userConfigDir\skills"
$rulesDir = "$userConfigDir\rules"
$workflowsDir = "$userConfigDir\global_workflows"

Write-Host "`n[1/5] 📁 Preparando directorios en: $userConfigDir" -ForegroundColor Green
$null = New-Item -ItemType Directory -Force -Path $skillsDir
$null = New-Item -ItemType Directory -Force -Path $rulesDir
$null = New-Item -ItemType Directory -Force -Path $workflowsDir

# 2. Instalar herramientas globales de Node.js
Write-Host "`n[2/5] 📦 Instalando herramientas globales (Firebase CLI y Capacitor CLI)..." -ForegroundColor Green
npm install -g firebase-tools @capacitor/cli

# 3. Instalar y copiar las 25 Skills
Write-Host "`n[3/5] 🧠 Instalando las 25 Agent Skills de Addy Osmani..." -ForegroundColor Green
npx skills add addyosmani/agent-skills --yes
if (Test-Path "$env:USERPROFILE\.agents\skills") {
    Copy-Item -Path "$env:USERPROFILE\.agents\skills\*" -Destination $skillsDir -Recurse -Force
    Write-Host "  ✓ Skills integradas correctamente en la configuración global." -ForegroundColor Cyan
}

# 4. Configurar Servidores MCP (mcp_config.json)
Write-Host "`n[4/5] 🔌 Configurando Servidores MCP (Chrome DevTools, GitHub, Figma)..." -ForegroundColor Green
$mcpJson = @'
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": ["-y", "chrome-devtools-mcp@latest"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": ""
      }
    },
    "figma": {
      "command": "npx",
      "args": ["-y", "figma-developer-mcp@latest"],
      "env": {
        "FIGMA_ACCESS_TOKEN": ""
      }
    }
  }
}
'@
$mcpJsonPath = "$userConfigDir\mcp_config.json"
Set-Content -Path $mcpJsonPath -Value $mcpJson -Encoding UTF8
Write-Host "  ✓ Archivo mcp_config.json creado." -ForegroundColor Cyan

# 5. Crear Regla Permanente de Diseño (shadcn/ui + Lucide Icons)
Write-Host "`n[5/5] 🎨 Registrando estándares de diseño (shadcn/ui + Lucide Icons)..." -ForegroundColor Green
$uiRule = @'
# Estándares de Diseño y UI para Aplicaciones

## Directiva de Componentes e Iconografía
1. **Catálogo de Componentes:**
   - Para cualquier desarrollo web o interfaz de usuario, utiliza de forma predeterminada el catálogo de componentes de **`shadcn/ui`** (botones, tarjetas, diálogos, formularios, navegación, tablas, selectores, modales).
   - No generes estilos CSS manuales aislados o componentes ad-hoc cuando exista un componente equivalente en `shadcn/ui`.

2. **Librería de Iconos:**
   - Utiliza exclusivamente **`lucide-react`** (o `lucide-vue` / `lucide` según el framework) para toda la iconografía de la aplicación.
   - Todos los iconos deben ser vectoriales, limpios y consistentes.

3. **Estilos y Maquetación:**
   - Emplea **Tailwind CSS** para el espaciado, tipografía y diseño responsivo.
   - Asegura siempre soporte para modo oscuro (*dark mode*), contrastes accesibles (normas WCAG) y micro-interacciones suaves.
'@
$uiRulePath = "$rulesDir\ui_standards.md"
Set-Content -Path $uiRulePath -Value $uiRule -Encoding UTF8
Write-Host "  ✓ Regla global de UI establecida." -ForegroundColor Cyan

# 6. Copiar Workflows si existen en la carpeta actual
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if (Test-Path "$scriptDir\global_workflows") {
    Copy-Item -Path "$scriptDir\global_workflows\*" -Destination $workflowsDir -Recurse -Force
    Write-Host "  ✓ Workflows de tu repositorio sincronizados." -ForegroundColor Cyan
}

Write-Host "`n==========================================================" -ForegroundColor Green
Write-Host "  🎉 ¡CONFIGURACIÓN COMPLETADA CON ÉXITO PARA $env:USERNAME!  " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Green
Write-Host "Tu Antigravity IDE ya tiene todas las skills, herramientas y MCPs listos.`n"
