@echo off
setlocal
cd /d "%~dp0"
title Crakbit Bank System Check
echo ================================================
echo  Crakbit Bank - System Check
echo ================================================
where node >nul 2>nul
if errorlevel 1 (
  echo [FAIL] Node.js not found.
  pause
  exit /b 1
)
for /f "tokens=*" %%v in ('node -v') do echo [OK] Node %%v
node --no-warnings -e "const {DatabaseSync}=require('node:sqlite'); const d=new DatabaseSync(':memory:'); d.exec('create table t(x); insert into t values(1)'); if(d.prepare('select x from t').get().x!==1) process.exit(2); console.log('[OK] Built-in SQLite available');"
if errorlevel 1 (
  echo [FAIL] This Node.js version does not provide the required built-in SQLite module.
  echo Install Node.js 22.5 or newer.
  pause
  exit /b 1
)
node --check server.mjs >nul
if errorlevel 1 (
  echo [FAIL] server.mjs syntax check failed.
  pause
  exit /b 1
)
echo [OK] Server syntax valid
node --check v16.mjs >nul
if errorlevel 1 (
  echo [FAIL] v16.mjs syntax check failed.
  pause
  exit /b 1
)
echo [OK] v1.6 module syntax valid
node --check public\app.js >nul
if errorlevel 1 (
  echo [FAIL] public\app.js syntax check failed.
  pause
  exit /b 1
)
echo [OK] UI JavaScript syntax valid
echo [OK] No npm packages required
echo [OK] No Docker required
echo [OK] No Prisma required
echo.
echo System prerequisites passed.
pause
endlocal
