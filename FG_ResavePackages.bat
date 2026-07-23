@echo off
setlocal

set "UE_EDITOR=C:\Program Files\Epic Games\UE_5.7\Engine\Binaries\Win64\UnrealEditor-Cmd.exe"
set "PROJECT=%~dp0FGStudio.uproject"
set "LOGFILE=%~dp0FG_ResavePackages.log"

if exist "%LOGFILE%" del /q "%LOGFILE%"

echo ========================================
echo Resaving FGStudio packages
echo This does not replace Blueprint nodes.
echo ========================================

"%UE_EDITOR%" "%PROJECT%" ^
-run=ResavePackages ^
-ProjectOnly ^
-IgnoreChangelist ^
-NoShaderCompile ^
-Unattended ^
-NullRHI ^
-ABSLOG="%LOGFILE%"

set "RESULT=%ERRORLEVEL%"

echo.
if "%RESULT%"=="0" (
    echo ========================================
    echo RESAVE COMPLETED
    echo ========================================
) else (
    echo ========================================
    echo RESAVE FINISHED WITH ERRORS
    echo Exit code: %RESULT%
    echo Check: %LOGFILE%
    echo ========================================
)

pause
exit /b %RESULT%