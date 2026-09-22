@echo off
cd /d "%~dp0"
title Crakbit Bank Database Reset
echo This deletes the local Crakbit Bank SQLite database.
choice /C YN /M "Reset database"
if errorlevel 2 exit /b
node --no-warnings reset-db.mjs
echo Done. Run START_CRAKBIT_BANK.cmd to create a new database.
pause
