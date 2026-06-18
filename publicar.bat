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

:: Commit com data e hora automaticos
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set dt=%%a
set DATAHORA=%dt:~6,2%/%dt:~4,2%/%dt:~0,4% %dt:~8,2%:%dt:~10,2%
git commit -m "Atualizacao em %DATAHORA%"

:: Push
git push -u origin main

echo.
echo  ================================
echo   Pronto! Roteiro publicado.
echo  ================================
echo.
pause
