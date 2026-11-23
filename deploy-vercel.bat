@echo off
cd /d "%~dp0"

echo ========================================================
echo        Deploying Himachal Showcase to Vercel
echo ========================================================
echo.

npx vercel --prod

echo.
pause
