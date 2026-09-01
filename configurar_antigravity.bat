<# : batch script
@echo off
chcp 65001 > nul
title Configurando Antigravity IDE - Setup Autónomo

powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-Expression ([System.IO.File]::ReadAllText('%~f0', [System.Text.Encoding]::UTF8))"
if %ERRORLEVEL% neq 0 (
    echo.
    echo [ERROR] Hubo un problema al ejecutar la instalacion.
)
echo.
pause
exit /b %ERRORLEVEL%
#>

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = "Continue"

Write-Host "====================================================================" -ForegroundColor Cyan
Write-Host "  🚀 CONFIGURADOR DE ANTIGRAVITY IDE (INSTALADOR MULTI-EQUIPO)     " -ForegroundColor Yellow
Write-Host "====================================================================" -ForegroundColor Cyan

# 1. Comprobar que Node.js y npm están instalados
Write-Host "`n[1/6] 🔍 Comprobando requisitos previos..." -ForegroundColor Green
$npmCmd = Get-Command npm -ErrorAction SilentlyContinue
if (-not $npmCmd) {
    Write-Host "  ❌ ERROR: Node.js (npm) no está instalado en este equipo." -ForegroundColor Red
    Write-Host "  Por favor, descarga e instala Node.js desde: https://nodejs.org/" -ForegroundColor Yellow
    Write-Host "  Tras instalarlo, vuelve a ejecutar este archivo.`n" -ForegroundColor Yellow
    exit 1
}
Write-Host "  ✓ Node.js y npm detectados correctamente." -ForegroundColor Cyan

# 2. Rutas dinámicas
$userConfigDir = "$env:USERPROFILE\.gemini\config"
$skillsDir = "$userConfigDir\skills"
$rulesDir = "$userConfigDir\rules"
$workflowsDir = "$userConfigDir\global_workflows"

Write-Host "`n[2/6] 📁 Preparando directorios en: $userConfigDir" -ForegroundColor Green
$null = New-Item -ItemType Directory -Force -Path $skillsDir
$null = New-Item -ItemType Directory -Force -Path $rulesDir
$null = New-Item -ItemType Directory -Force -Path $workflowsDir
Write-Host "  ✓ Directorios creados correctamente." -ForegroundColor Cyan

# 3. Herramientas globales de Node.js
Write-Host "`n[3/6] 📦 Instalando Firebase CLI y Capacitor CLI..." -ForegroundColor Green
npm install -g firebase-tools @capacitor/cli

# 4. Agent Skills
Write-Host "`n[4/6] 🧠 Instalando las 25 Agent Skills de Addy Osmani..." -ForegroundColor Green
npx -y skills add addyosmani/agent-skills
if (Test-Path "$env:USERPROFILE\.agents\skills") {
    Copy-Item -Path "$env:USERPROFILE\.agents\skills\*" -Destination $skillsDir -Recurse -Force
    Write-Host "  ✓ 25 Skills integradas globalmente." -ForegroundColor Cyan
}

# 5. Servidores MCP y Estándares de Diseño
Write-Host "`n[5/6] 🔌 Configurando Servidores MCP y Reglas de UI..." -ForegroundColor Green
$mcpContent = @'
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
Set-Content -Path "$userConfigDir\mcp_config.json" -Value $mcpContent -Encoding UTF8

$uiRuleContent = @'
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
Set-Content -Path "$rulesDir\ui_standards.md" -Value $uiRuleContent -Encoding UTF8
Write-Host "  ✓ mcp_config.json y ui_standards.md guardados." -ForegroundColor Cyan

# 6. Workflows
Write-Host "`n[6/6] 📥 Descargando Workflows oficiales..." -ForegroundColor Green
$repoBase = "https://raw.githubusercontent.com/danielayuntnumancia-dotcom/Antigravity-IDE/main/global_workflows"
$wfs = @("convertir_apk.md", "sincronizar.md", "terminar.md", "verificar-estado.md")
foreach ($wf in $wfs) {
    try {
        Invoke-WebRequest -Uri "$repoBase/$wf" -OutFile "$workflowsDir\$wf" -UseBasicParsing
        Write-Host "  ✓ Workflow $wf descargado." -ForegroundColor Cyan
    } catch {
        Write-Host "  ! No se pudo descargar $wf desde GitHub." -ForegroundColor Yellow
    }
}

Write-Host "`n====================================================================" -ForegroundColor Green
Write-Host "  🎉 ¡ENTORNO 100% CONFIGURADO CON ÉXITO PARA $env:USERNAME!         " -ForegroundColor Yellow
Write-Host "====================================================================" -ForegroundColor Green
Write-Host "Antigravity IDE ya tiene todas las skills, herramientas y MCPs listos.`n"
