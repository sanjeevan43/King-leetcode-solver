@echo off
echo Starting LeetCode AI Solver...

echo.
echo Starting Backend API...
cd backend
start "Backend API" cmd /k "python run_server.py"

echo.
echo Starting Frontend...
cd ..\Leet-Code-AI
start "Frontend" cmd /k "npm run dev"

echo.
echo Applications starting...
echo Backend: http://localhost:5000
echo Frontend: http://localhost:5173
echo.
pause