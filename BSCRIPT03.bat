@echo off
rem This batch file enables users to select and execute fundamental Windows utilities

:menu
echo Windows Utility Execution Menu:
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
echo 9. Exit
set /p choice=Enter the number you want to execute (1-9):

if %choice%==1 goto ipconfig
if %choice%==2 goto tasklist
if %choice%==3 goto taskkill
if %choice%==4 goto chkdsk
if %choice%==5 goto format
if %choice%==6 goto defrag
if %choice%==7 goto find
if %choice%==8 goto attrib
if %choice%==9 goto end
echo Invalid choice. Please try again.
goto menu

:ipconfig
ipconfig
goto continue

:tasklist
tasklist
goto continue

:taskkill
set /p pid=Enter the PID of the process to kill:
taskill /PID %pid%
if %errorlevel% neq 0 (
    echo Failed to kill process with PID %pid%.
) else (
    echo Process with PID %pidhas been terminated.
)
goto continue

:chkdsk
set /p drive=Enter the drive letter to check (ex: C:):
chkdsk %drive%
goto continue

:format
set /p drive=Enter the drive letter to format (ex: D:):
echo Warning: This will erase all data on %drive%. Are you sure? (y/n):
set /p confirm=
if /i "%confirm%"=="y" (
    format %drive%
    if %errorlevel% neq 1 (
        echo Failed to format drive %drive%.
    ) else (
        echo Drive %drive% has been formatted.
    )
) else (
    echo Format operation cancelled.
)
goto continue

:defrag
set /p drive=Enter the drive letter to defrag (ex: C:):
defrag %drive%
goto continue

:find
set /p string=Enter the string to find:
set /p file=Enter the file to search in:
find "%string%" %file%
if %errorlevel% neq 0 (
    echo String "%string%" not found in file %file%.
) else (
    echo String "%string%" found in file %file%.
)
goto continue

:attrib
set /p file=Enter the file of directory to change attributes for: 
set /p attributes=Enter the attributes to set (ex: +r, -h):
attrib %attributes% %file%
if %errorlevel% neq 0 (
    echo Failed to change attributes for %file%.
) else (
    echo Attributes for %file% have been changed.
)
goto continue

:continue
echo.
set /p repeat=Do you want to execute another utility? (y/n): 
if /i "%repeat%"=="y" goto menu
if /i "%repeat%"=="n" goto end
echo Invalid input. Please enter 'y' or 'n'.
goto continue

:end
echo Thank you for using the Windows Utility Execution Menu.
echo
pause