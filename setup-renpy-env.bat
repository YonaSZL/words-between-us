@echo off
setlocal EnableDelayedExpansion

set "RENPY_PROJECT=%~dp0"
set "RENPY_PROJECT=%RENPY_PROJECT:~0,-1%"
set "SDK_COUNT=0"
set "RENPY_SDK="

for /d %%D in ("%~dp0..\*sdk") do (
    set /a SDK_COUNT+=1
    set "RENPY_SDK=%%~fD"
)

if %SDK_COUNT%==0 (
    echo No Ren'Py SDK found.
    echo Press any key to close...
    pause >nul
    exit /b 1
)

if %SDK_COUNT% GTR 1 (
    echo Multiple Ren'Py SDKs found:
    for /d %%D in ("%~dp0..\*sdk") do echo %%~fD
    echo Please keep only one SDK or adjust the configuration.
    echo Press any key to close...
    pause >nul
    exit /b 1
)

setx RENPY_SDK "%RENPY_SDK%"
setx RENPY_PROJECT "%RENPY_PROJECT%"

echo.
echo RENPY_SDK=%RENPY_SDK%
echo RENPY_PROJECT=%RENPY_PROJECT%

echo.
echo Press any key to close...
pause >nul

endlocal
