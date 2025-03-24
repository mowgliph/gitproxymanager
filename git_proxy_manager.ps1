# Script para gestionar el uso de proxy en Git y actualizar configuraciones globales

# Funcion para obtener la configuracion del proxy en Git
function Get-GitProxy {
    $httpProxy = git config --global --get http.proxy
    $httpsProxy = git config --global --get https.proxy
    
    if ($httpProxy -or $httpsProxy) {
        Write-Host "Proxy HTTP: $httpProxy" -ForegroundColor Green
        Write-Host "Proxy HTTPS: $httpsProxy" -ForegroundColor Green
    } else {
        Write-Host "No hay proxy configurado en Git." -ForegroundColor Yellow
    }
}

# Función para eliminar el proxy en Git
function Remove-GitProxy {
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    Write-Host "Proxy eliminado correctamente." -ForegroundColor Green
}

# Función para configurar un nuevo proxy en Git
function Set-GitProxy {
    $proxyUrl = Read-Host "Introduce la URL del proxy (ejemplo: http://proxyservidor:puerto)"
    git config --global http.proxy $proxyUrl
    git config --global https.proxy $proxyUrl
    Write-Host "Proxy configurado correctamente." -ForegroundColor Green
}

# Función para actualizar configuraciones globales de Git
function Update-GitGlobalSettings {
    Write-Host "Actualizando configuraciones globales de Git..." -ForegroundColor Cyan
    git config --global init.defaultBranch main
    git config --global pull.rebase false
    git config --global fetch.prune true
    git config --global core.autocrlf input
    git config --global diff.tool vimdiff
    git config --global credential.helper cache
    git config --global push.default simple
    Write-Host "Configuraciones globales de Git actualizadas." -ForegroundColor Green
}

# Menú principal
function Show-Menu {
    while ($true) {
        Clear-Host
        Write-Host "=====================" -ForegroundColor Cyan
        Write-Host "  Gestor de Proxy y Configuracion de Git" -ForegroundColor Cyan
        Write-Host "=====================" -ForegroundColor Cyan
        Write-Host "1. Ver configuracion del proxy en Git"
        Write-Host "2. Configurar un proxy en Git"
        Write-Host "3. Eliminar configuracion de proxy en Git"
        Write-Host "4. Aplicar configuraciones globales modernas en Git"
        Write-Host "5. Salir"
        
        $option = Read-Host "Elige una opcion"
        switch ($option) {
            "1" { Get-GitProxy }
            "2" { Set-GitProxy }
            "3" { Remove-GitProxy }
            "4" { Update-GitGlobalSettings }
            "5" { exit }
            default { Write-Host "Opcion no valida. Intentalo de nuevo." -ForegroundColor Red }
        }
        
        Pause
    }
}

# Ejecutar el menú
Show-Menu
