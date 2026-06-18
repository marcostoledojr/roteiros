@echo off
echo.
echo  ================================
echo   Publicando roteiros...
echo  ================================
echo.

cd /d "%~dp0"

:: Configura o remote na primeira vez
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo Configurando repositorio pela primeira vez...
    git remote add origin https://github.com/marcostoledojr/roteiros.git
)

:: Adiciona todos os arquivos
git add .

:: Commit com data e hora
git commit -m "Atualizacao em %date% %time:~0,5%"

:: Sincroniza com o GitHub antes de subir
git pull origin main --rebase

:: Push
git push -u origin main

echo.
echo  ================================
echo   Pronto! Roteiro publicado.
echo  ================================
echo.
pause
