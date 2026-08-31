@echo off
chcp 65001 > nul
title Configurando Antigravity IDE - Setup Autónomo

echo ====================================================================
echo   🚀 CONFIGURADOR AUTONOMO DE ANTIGRAVITY IDE (TODO EN 1 ARCHIVO)
echo ====================================================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$userConfigDir = \"$env:USERPROFILE\.gemini\config\";" ^
    "$skillsDir = \"$userConfigDir\skills\";" ^
    "$rulesDir = \"$userConfigDir\rules\";" ^
    "$workflowsDir = \"$userConfigDir\global_workflows\";" ^
    "Write-Host '`n[1/5] 📁 Preparando directorios en:' $userConfigDir -ForegroundColor Green;" ^
    "$null = New-Item -ItemType Directory -Force -Path $skillsDir;" ^
    "$null = New-Item -ItemType Directory -Force -Path $rulesDir;" ^
    "$null = New-Item -ItemType Directory -Force -Path $workflowsDir;" ^
    "Write-Host '`n[2/5] 📦 Instalando Firebase CLI y Capacitor CLI...' -ForegroundColor Green;" ^
    "npm install -g firebase-tools @capacitor/cli;" ^
    "Write-Host '`n[3/5] 🧠 Instalando las 25 Agent Skills de Addy Osmani...' -ForegroundColor Green;" ^
    "npx skills add addyosmani/agent-skills --yes;" ^
    "if (Test-Path \"$env:USERPROFILE\.agents\skills\") { Copy-Item -Path \"$env:USERPROFILE\.agents\skills\*\" -Destination $skillsDir -Recurse -Force; Write-Host '  ✓ 25 Skills integradas globalmente.' -ForegroundColor Cyan; };" ^
    "Write-Host '`n[4/5] 🔌 Configurando Servidores MCP y Estandares de Diseno...' -ForegroundColor Green;" ^
    "$mcp = '{\"mcpServers\":{\"chrome-devtools\":{\"command\":\"npx\",\"args\":[\"-y\",\"chrome-devtools-mcp@latest\"]},\"github\":{\"command\":\"npx\",\"args\":[\"-y\",\"@modelcontextprotocol/server-github\"],\"env\":{\"GITHUB_PERSONAL_ACCESS_TOKEN\":\"\"}},\"figma\":{\"command\":\"npx\",\"args\":[\"-y\",\"figma-developer-mcp@latest\"],\"env\":{\"FIGMA_ACCESS_TOKEN\":\"\"}}}}';" ^
    "Set-Content -Path \"$userConfigDir\mcp_config.json\" -Value $mcp -Encoding UTF8;" ^
    "$uiRule = '# Estandares de Diseno y UI para Aplicaciones`n`n1. **Componentes:** Usar por defecto el catalogo de shadcn/ui.`n2. **Iconos:** Usar exclusivamente lucide-react.`n3. **Estilos:** Emplear Tailwind CSS con modo oscuro y accesibilidad WCAG.';" ^
    "Set-Content -Path \"$rulesDir\ui_standards.md\" -Value $uiRule -Encoding UTF8;" ^
    "Write-Host '  ✓ MCPs y reglas de UI guardadas.' -ForegroundColor Cyan;" ^
    "Write-Host '`n[5/5] 📥 Descargando Workflows oficiales desde GitHub...' -ForegroundColor Green;" ^
    "$repoBase = 'https://raw.githubusercontent.com/danielayuntnumancia-dotcom/Antigravity-IDE/main/global_workflows';" ^
    "$wfs = @('convertir_apk.md', 'sincronizar.md', 'terminar.md', 'verificar-estado.md');" ^
    "foreach ($wf in $wfs) { try { Invoke-WebRequest -Uri \"$repoBase/$wf\" -OutFile \"$workflowsDir\$wf\" -UseBasicParsing; Write-Host \"  ✓ Workflow $wf descargado.\" -ForegroundColor Cyan; } catch { Write-Host \"  ! No se pudo descargar $wf\" -ForegroundColor Yellow; } };" ^
    "Write-Host '`n====================================================================' -ForegroundColor Green;" ^
    "Write-Host \"  🎉 ¡ENTORNO 100% CONFIGURADO CON EXITO PARA $env:USERNAME! \" -ForegroundColor Yellow;" ^
    "Write-Host '====================================================================' -ForegroundColor Green;" ^
    "Write-Host 'Antigravity IDE ya esta listo para trabajar en este equipo.`n';"

echo.
echo Presiona cualquier tecla para cerrar esta ventana...
pause > nul
