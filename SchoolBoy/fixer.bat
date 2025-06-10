:: FIXER BY https://thelastgame.org! ::

@echo off
net session >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Requesting administrative privileges... No worry, it need. If you thinks it virus, check a code.
    if not exist "%TEMP%\fixer_running.flag" (
        echo Running > "%TEMP%\fixer_running.flag"
        powershell -Command "Start-Process '%~f0' -Verb RunAs" >nul 2>&1
        del "%TEMP%\fixer_running.flag" >nul 2>&1
        if %ERRORLEVEL% neq 0 (
            echo If you clicked "No" please, restart fixer.bat and click "Yes". If clicked "Yes", ignore it!
            pause
            exit /b
        )
    ) else (
        echo If you clicked "No" please, restart fixer.bat and click "Yes". If clicked "Yes", ignore it!
        del "%TEMP%\fixer_running.flag" >nul 2>&1
        pause
        exit /b
    )
)

echo Starting fixer.bat...
set "SchoolBoyFolder=%USERPROFILE%\Desktop\SchoolBoy"
if not exist "%SchoolBoyFolder%" (
    echo Error: SchoolBoy folder not found on Desktop! Please, unrar to Desktop!
    pause
    exit /b
)
echo Fixing SchoolBoy Runaway files...
powershell -Command "Add-MpPreference -ExclusionPath '%SchoolBoyFolder%'" >nul 2>&1
if %ERRORLEVEL%==0 (
    echo Successfully fixed %SchoolBoyFolder%! Changes: Added to Windows Defender exclusions.
) else (
    echo Failed to fix %SchoolBoyFolder% to Windows Defender exclusions.
)
echo Fixing is completed.
pause