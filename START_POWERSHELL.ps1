$env:PORT = "7979"
Set-Location $PSScriptRoot
if (-not (Get-Command node -ErrorAction SilentlyContinue)) { Write-Host "Node.js 22.5+ is required." -ForegroundColor Red; exit 1 }
$portFile = Join-Path $PSScriptRoot "data\port.txt"
Remove-Item $portFile -Force -ErrorAction SilentlyContinue
Start-Process powershell -ArgumentList "-NoExit", "-Command", "Set-Location '$PSScriptRoot'; `$env:PORT='7979'; node --no-warnings server.mjs"
for ($i=0; $i -lt 20; $i++) {
  Start-Sleep -Seconds 1
  if (Test-Path $portFile) { $p=(Get-Content $portFile -Raw).Trim(); Start-Process "http://127.0.0.1:$p"; exit 0 }
}
Write-Host "Server did not start. Check the Crakbit Bank Server window." -ForegroundColor Red
