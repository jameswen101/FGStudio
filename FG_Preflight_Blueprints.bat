@echo off
set UE_EDITOR=C:\Program Files\Epic Games\UE_5.7\Engine\Binaries\Win64\UnrealEditor-Cmd.exe
set PROJECT=C:\Users\raywe\Documents\Unreal Projects\FGStudio 5.7\FGStudio.uproject

"%UE_EDITOR%" "%PROJECT%" ^
-run=CompileAllBlueprints ^
-ProjectOnly ^
-Unattended ^
-NullRHI ^
-Log="%~dp0FG_CompileAllBlueprints.log"

echo.
echo Blueprint preflight finished.
pause