@echo off
cd /d "%~dp0"

set "exclude=.git .vscode .idea"

echo Cleaning Ren'Py cache...
for /r %%i in (*.rpyc) do call :deleteFile "%%i"
for /r %%i in (*.rpymc) do call :deleteFile "%%i"
call :deleteFolder "game\cache"

echo Cleaning error files...
for /r %%i in (errors.txt) do call :deleteFile "%%i"
for /r %%i in (traceback.txt) do call :deleteFile "%%i"

echo Done.
pause
exit /b

:deleteFile
if exist "%~1" (
    echo %~1 | findstr /i "%exclude%" >nul || del "%~1"
)
exit /b

:deleteFolder
if exist "%~1" (
    echo %~1 | findstr /i "%exclude%" >nul || rd /s /q "%~1"
)
exit /b
