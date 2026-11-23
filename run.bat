@echo off
cd /d "%~dp0"

echo ========================================================
echo              Starting Himachal Showcase App
echo ========================================================
echo.
echo Opening Himachal showcase app at http://localhost:8080 ...
echo.

pnpm dev
