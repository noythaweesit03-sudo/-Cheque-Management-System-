@echo off
title Cheque Management System Server
color 0A
echo ========================================================
echo   CHEQUE MANAGEMENT SYSTEM (ระบบจัดทำและสั่งพิมพ์เช็ค)
echo ========================================================
echo.
echo กำลังเริ่มต้นระบบ... กรุณารอสักครู่
echo.

:: ตรวจสอบว่ามี node หรือไม่
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] ไม่พบ Node.js ในเครื่องนี้!
    echo กรุณาดาวน์โหลดและติดตั้ง Node.js จาก https://nodejs.org ก่อนใช้งาน
    pause
    exit /b
)

:: ตรวจสอบโฟลเดอร์ dist ถ้ายังไม่มีให้ build ก่อน
if not exist "dist" (
    echo กำลัง Build ระบบในครั้งแรก...
    call npm run build
)

echo.
echo ========================================================
echo   ระบบพร้อมใช้งานแล้ว!
echo   เปิดเว็บเบราว์เซอร์และเข้าไปที่: http://localhost:3000
echo ========================================================
echo.

:: เปิด Google Chrome หรือเบราว์เซอร์หลักอัตโนมัติ
start http://localhost:3000

:: รันเซิร์ฟเวอร์
npm start
