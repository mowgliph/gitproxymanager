# Git Proxy Manager

Este script de **PowerShell** permite gestionar la configuración de proxy en **Git**, además de actualizar configuraciones globales recomendadas para un mejor rendimiento y experiencia.

## Características
- Verificar si Git está usando un proxy.
- Configurar un proxy en Git.
- Eliminar la configuración de proxy en Git.
- Aplicar configuraciones globales modernas y recomendadas en Git.

## Requisitos
- **Windows** con PowerShell instalado.
- **Git** instalado y disponible en la terminal.

## Instalación
1. Descarga el script `git_proxy_manager.ps1` y guárdalo en una carpeta de tu preferencia.
2. Abre **PowerShell** y navega hasta la ubicación del script:
   ```powershell
   cd ruta/del/script
   ```
3. Si PowerShell restringe la ejecución de scripts, habilítalo con:
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force
   ```

## Uso
Para ejecutar el script, usa el siguiente comando en PowerShell:
```powershell
powershell -ExecutionPolicy Bypass -File .\git_proxy_manager.ps1
```

Aparecerá un **menú interactivo** con las siguientes opciones:

### 1. Ver configuración del proxy en Git
Muestra la configuración actual del proxy en Git.

### 2. Configurar un proxy en Git
Permite ingresar una dirección de proxy para configurarla en Git.

### 3. Eliminar configuración de proxy en Git
Elimina cualquier configuración de proxy establecida en Git.

### 4. Aplicar configuraciones globales modernas en Git
Actualiza Git con las mejores configuraciones globales recomendadas, incluyendo:
- `init.defaultBranch` → `main`
- `pull.rebase` → `false`
- `fetch.prune` → `true`
- `core.autocrlf` → `input`
- `diff.tool` → `vimdiff`
- `credential.helper` → `cache`
- `push.default` → `simple`

### 5. Salir
Finaliza el script.

## Notas
- El script solo afecta la configuración **global** de Git.
- Si deseas configurar un proxy de forma local para un solo repositorio, usa:
  ```powershell
  git config --local http.proxy http://proxyservidor:puerto
  ```

## Contribuciones
Si tienes sugerencias o mejoras, ¡siéntete libre de contribuir! Puedes hacer un **fork** del repositorio y enviar un **pull request**.

## Licencia
Este proyecto está bajo la **MIT License**.
