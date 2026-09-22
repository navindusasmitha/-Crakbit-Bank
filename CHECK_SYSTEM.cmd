@echo off
setlocal
cd /d "%~dp0"
title Crakbit Bank System Check
echo ================================================
echo  Crakbit Bank v1.6 - System Check
echo ================================================
where node >nul 2>nul
if errorlevel 1 (
  echo [FAIL] Node.js not found. Install Node.js 22.5 or newer.
  pause
  exit /b 1
)
for /f "tokens=*" %%v in ('node -v') do echo [OK] Node %%v

if not exist "server.mjs" (
  echo [INFO] Restoring verified v1.6 source files from repository payload...
  node --no-warnings restore-source.mjs
  if errorlevel 1 (
    echo [FAIL] Source restoration failed.
    pause
    exit /b 1
  )
)

node --no-warnings -e "const {DatabaseSync}=require('node:sqlite'); const d=new DatabaseSync(':memory:'); d.exec('create table t(x); insert into t values(1)'); if(d.prepare('select x from t').get().x!==1) process.exit(2); console.log('[OK] Built-in SQLite available');"
if errorlevel 1 (
  echo [FAIL] Built-in SQLite unavailable. Install Node.js 22.5 or newer.
  pause
  exit /b 1
)
node --check server.mjs >nul || (echo [FAIL] server.mjs syntax check failed.& pause & exit /b 1)
echo [OK] server.mjs syntax valid
node --check v16.mjs >nul || (echo [FAIL] v16.mjs syntax check failed.& pause & exit /b 1)
echo [OK] v16.mjs syntax valid
node --check public\app.js >nul || (echo [FAIL] public\app.js syntax check failed.& pause & exit /b 1)
echo [OK] public\app.js syntax valid
echo [OK] No npm packages required
echo [OK] No Docker required
echo [OK] No Prisma required
echo.
echo System prerequisites passed.
pause
endlocal
