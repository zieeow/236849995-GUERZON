@echo off
rem This batch file prompt the user to select one of three shapes: circle, triangle, or quadrilateral to calculate.

echo Welcome to Fiowiee's Shape area Calculator!

:menu
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
set /p choice=Enter the number you want to calculate(1/2/3):

if %choice%==1 goto circle
if %choice%==2 goto triangle
if %choice%==3 goto quadrilateral
echo Invalid choice.Please try again.
goto menu


:circle
set /p radius=Enter the radius of the circle:
set /a radius_squared=%radius% * %radius%
set /a area_int=(314159 * %radius_squared%) / 100000
echo The area of the circle is %area_int%


:triangle

set /p side1=Enter the length of the first side:
set /p side2=Enter the length of the second side:
set /p side3=Enter the lenth of the third side:
set /a s=(%side1% + %side2% + %side3%) / 2

set /a area_square=%s% * (%s% - %side1%) * (%s% - %side2%) * (%s% - %side3%)

if %area_square% lss 0 (
    echo Invalid triangle side
    goto continue
)

echo The (approximate) squared area of the triangle is %area_square%.

if %side1%==%side2% if %side2%==%side3% (
    echo The triangle is equilateral.
) else if %side1%==%side2% if not %side2%==%side3% (
    echo The triangle is isosceles.
) else if %side1%==%side3% if not %side2%==%side3% (
    echo The triangle is isosceles.
) else if %side2%==%side3% if not %side1%==%side3% (
    echo The triangle is isosceles.
) else (
    echo The triangle is scalene.
)
goto continue

:quadrilateral

set /p length=Enter the length of the quadrilateral: 
set /p width=Enter the width of the quadrilateral: 
set /a area=%length% * %width%
echo The area of the quadrilateral is %area%.


if %length%==%width% (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)
goto continue

:continue
echo.
set /p repeat= Do you want to perform another calculation (y/n):
if /i "%repeat%"=="y" goto menu
if /i "%repeat%"=="n" goto end
echo Invalid input.Please enter 'y' or 'n'.
goto continue

:end
echo Thank you for using Cheeseshi's shape area calculator!
echo
pause
