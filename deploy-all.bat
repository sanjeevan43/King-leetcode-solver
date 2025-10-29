@echo off
echo Deploying LeetCode AI Solver...

echo.
echo 1. Deploying backend to Vercel...
cd backend
call vercel --prod

echo.
echo 2. Building frontend...
cd ..\Leet-Code-AI
call npm run build

echo.
echo Deployment complete!
echo - Backend: Check Vercel dashboard for URL
echo - Frontend: Push dist folder to GitHub Pages
echo.
pause