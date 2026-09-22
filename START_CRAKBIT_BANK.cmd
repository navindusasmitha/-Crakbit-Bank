@echo off
setlocal
cd /d "%~dp0"
title Crakbit Bank Launcher
cls
echo ================================================
echo  Crakbit Bank - Core Banking Suite v1.6
echo ================================================
where node >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Node.js 22.5 or newer was not found in PATH.
  pause
  exit /b 1
)
for /f "tokens=*" %%v in ('node -v') do echo Node: %%v

if not exist "server.mjs" (
  echo [INFO] Application source is packed in this GitHub repository.
  echo [INFO] Restoring verified v1.6 source files now...
  node --no-warnings restore-source.mjs
  if errorlevel 1 (
    echo [ERROR] Source restoration failed. You can also run RESTORE_SOURCE.cmd manually.
    pause
    exit /b 1
  )
)

if exist "data\port.txt" del /q "data\port.txt" >nul 2>nul
echo.
echo Starting Crakbit Bank v1.6 on port 7979...
set PORT=7979
start "Crakbit Bank Server" cmd /k "node --no-warnings server.mjs"
set BANKPORT=
for /l %%i in (1,1,20) do (
  if exist "data\port.txt" (
    set /p BANKPORT=<"data\port.txt"
    goto :OPENBANK
  )
  timeout /t 1 /nobreak >nul
)
echo [ERROR] Server did not report a port.
echo Check the "Crakbit Bank Server" window for the exact error.
pause
exit /b 1

:OPENBANK
if "%BANKPORT%"=="" set BANKPORT=7979
echo Server online on port %BANKPORT%.
start "" "http://127.0.0.1:%BANKPORT%"
echo Browser opened: http://127.0.0.1:%BANKPORT%
echo Staff: admin@crakbit.bank / ChangeMe123!
echo Customer: customer@crakbit.bank / ChangeMe123!
echo Corporate Maker: corporate@crakbit.bank / ChangeMe123!
echo Corporate Approver: corp.approver@crakbit.bank / ChangeMe123!
timeout /t 4 /nobreak >nul
endlocal
