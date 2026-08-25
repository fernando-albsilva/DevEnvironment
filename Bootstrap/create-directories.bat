@echo off
setlocal

echo ============================================
echo   Configuracao do Ambiente de Desenvolvimento
echo ============================================
echo.

REM ==================================================
REM RAIZ
REM ==================================================

set "ROOT=%~dp0../Development"

echo Raiz: %ROOT%
echo.



REM ==================================================
REM PROJECTS
REM ==================================================

echo Criando Projects...

mkdir "%ROOT%\Projects" 2>nul


REM ==================================================
REM KNOWLEDGE
REM ==================================================

echo Criando Knowledge...

mkdir "%ROOT%\Knowledge\SQL" 2>nul
mkdir "%ROOT%\Knowledge\Git" 2>nul
mkdir "%ROOT%\Knowledge\Docker" 2>nul


REM ==================================================
REM Troubleshooting
REM ==================================================

echo Criando Troubleshooting...

mkdir "%ROOT%\Troubleshooting" 2>nul

REM ==================================================
REM SCRIPTS
REM ==================================================

echo Criando Scripts...

mkdir "%ROOT%\Scripts\Bat" 2>nul
mkdir "%ROOT%\Scripts\PowerShell" 2>nul
mkdir "%ROOT%\Scripts\Bash" 2>nul

REM ==================================================
REM TEMPLATES
REM ==================================================

echo Criando Templates...

mkdir "%ROOT%\Templates" 2>nul


REM ==================================================
REM UTILS
REM ==================================================

echo Criando Utils...

mkdir "%ROOT%\Utils" 2>nul

REM ==================================================
REM FINAL
REM ==================================================

echo.
echo ============================================
echo   Ambiente criado com sucesso!
echo ============================================
echo.
echo Raiz:
echo %ROOT%
echo.
echo ============================================

pause

endlocal