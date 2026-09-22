@echo off
setlocal
cd /d "%~dp0"
title Crakbit Bank Source Restore
echo ================================================
echo  Crakbit Bank v1.6 - Source Restore
echo ================================================
where node >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Node.js 22.5 or newer is required.
  pause
  exit /b 1
)
echo Restoring the v1.6 application source from the verified repository payload...
node --no-warnings restore-source.mjs
if errorlevel 1 (
  echo [ERROR] Source restoration failed.
  pause
  exit /b 1
)
echo.
echo [OK] Source restore complete.
echo You can now run START_CRAKBIT_BANK.cmd
pause
endlocal
