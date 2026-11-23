@echo off
setlocal enabledelayedexpansion

echo ========================================================
echo          Pushing Himachal Project to GitHub
echo ========================================================
echo.

:: Navigate to script directory
cd /d "%~dp0"

echo Current directory: %cd%
echo.

:: Check if git is installed
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed or not found in PATH.
    echo Please install Git from https://git-scm.com/
    goto :end
)

:: Initialize git repository if not already initialized
if not exist ".git" (
    echo [INFO] Initializing Git repository...
    git init -b main
    git config user.email "tewarisudipti@gmail.com"
    git config user.name "Sudipti"
)

:: Set remote URL
set REMOTE_URL=https://github.com/tewarisudipti-git/india_inc_HP.git
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo [INFO] Setting remote origin to %REMOTE_URL%...
    git remote add origin %REMOTE_URL%
) else (
    echo [INFO] Updating remote origin to %REMOTE_URL%...
    git remote set-url origin %REMOTE_URL%
)

:: Stage all files
echo [INFO] Staging all files...
git add .

:: Commit if there are staged changes
git diff --cached --quiet
if %errorlevel% neq 0 (
    echo [INFO] Committing changes...
    git commit -m "Initial commit for Himachal Pradesh project"
) else (
    echo [INFO] All changes are already committed.
)

echo.
echo ========================================================
echo Pushing to GitHub (main branch)...
echo Note: If a browser window opens, sign in to your GitHub.
echo ========================================================
echo.

git push -u origin main
if %errorlevel% equ 0 (
    echo.
    echo [SUCCESS] Successfully pushed Himachal project to GitHub!
    echo Repository: %REMOTE_URL%
) else (
    echo.
    echo [ERROR] Push failed. If the remote repository does not exist yet,
    echo create https://github.com/new with name 'india_inc_HP' and try again.
)

:end
echo.
pause
