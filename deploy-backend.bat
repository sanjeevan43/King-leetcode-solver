@echo off
echo Deploying backend to Vercel...
cd backend
vercel --prod
echo.
echo Backend deployed! Update the API URL in the frontend if needed.
pause