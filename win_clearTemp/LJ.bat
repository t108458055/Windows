@echo off
echo  Cleanin temporary files ...

:: Define temporary directories
set TempDirs=%temp% %windir%\temp

:: Delete files in defined temporary directories
for %%d in (%TempDirs%) do (
    echo Deleting files in %%d...
    del /f /s /q "%%d\*.*"
)

:: Clear the Recycle Bin
echo Clearing the Recycle Bin...
rd /s /q %systemdrive%\$Recycle.Bin

:: Clean up specific user profile temporary locations
echo Deleting user profile temporary files...
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\AppData\Local\Temp\*.*"
del /f /q "%userprofile%\AppData\Local\Microsoft\Windows\INetCache\*.*" 
del /f /q "%userprofile%\AppData\Roaming\Microsoft\Windows\Cookies\*.*"
del /f /q "%userprofile%\AppData\Roaming\Microsoft\Windows\Recent\*.*"

:: Optional: Clear Prefetch (consider commenting out if you prefer not to clear prefetch files)
:: echo Clearing Prefetch files...
:: del /f /s /q "%windir%\Prefetch\*.*"

echo Cleaning complete.
echo.
pause