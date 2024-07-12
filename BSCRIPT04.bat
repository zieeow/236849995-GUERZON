@echo off


rem Set directories
set "source=C:\sourcedirectory"
set "archive=Z:\archive_directory"

rem Sort text files by date
for %%f in (%source%*.txt) do (
    for /f "tokens=1,2 delims=." %%a in ("%%~nf") do (
        set "date=%%b"
        set "name=%%a"
    )
    set "date=!date:~0,8!"
    set "time=!date:~8,4!"
    set "newname=!date!!time!%%~nxf"
    move "%%f" "%archive%!newname!" > nul
)

rem Sort archived files by size
cd /d "%archive%"
for /f "tokens=* delims=" %%f in ('dir /b /o-s /on') do (
    set "file=%%f"
    set "size=%%~zf"
    echo !size!: !file!
)

:menu
rem Prompt user to delete old, large files
set /p response=Do you want to delete the old, large files? (y/n): 
if /i "%response%"=="y" goto delete
if /i "%response%"=="n" goto end

:delete
rem Set thresholds for deletion (you can adjust these values as needed)
set "sizethreshold=500000"  REM Size threshold in bytes (e.g., 500000 bytes = 500 KB)
set "date_threshold=20240101"  REM Date threshold in YYYYMMDD format (e.g., January 1, 2024)

rem Delete files exceeding size threshold and older than date threshold
for /f "tokens=* delims=" %%f in ('dir /b /o-s /on') do (
    set "file=%%f"
    set "size=%%~zf"
    for /f "tokens=1,2 delims=" %%a in ("%%f") do (
            set "filedate=%%a"
    )
    if !size! gtr %size_threshold% if !filedate! lss %date_threshold% (
            del "%%f"
            echo Deleted: %%f
    )
)
else (
    echo Not deleting files.
    goto end
)

:end
echo Goodbye!
echo
pause