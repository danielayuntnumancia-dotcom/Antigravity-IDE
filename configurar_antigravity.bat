@echo off
chcp 65001 > nul
title Configurando Antigravity IDE...

echo ==========================================================
echo   🚀 INICIANDO CONFIGURACION DE ANTIGRAVITY IDE
echo ==========================================================
echo.
echo Ejecutando script de PowerShell con privilegios de usuario...
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0configurar_antigravity.ps1"

echo.
echo Presiona cualquier tecla para cerrar esta ventana...
pause > nul
