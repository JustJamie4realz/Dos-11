@echo off
set dosver=Dos [11.1.1]

:bios
echo Please wait for %dosver%
echo tip: go fullscreen for the best experience.
echo Fullscreen = f11
echo.
echo check out the Changelog to see new features
pause
goto sign-in

:sign-in
cls
title sign-in - %dosver%
color 0F
echo please sign in with password
set /p PASSWORD1=What is your password?:
for /f "Delims=" %%a in (password.txt) do (set TEXT=%%a)

if %PASSWORD1%==%TEXT% goto Doshome
if %PASSWORD1%=="" call emptypass.vbs
color 4F
call wrongpass.vbs
goto sign-in



:logout
goto sign-in

:Doshome
cls
color 0F
title %dosver%
echo Welcome To %dosver%!
echo Today is %date%
echo If you are new, type "help" for all commands you can use.
echo.
set /p PROGRAM=What do you want to do?: 
goto %PROGRAM%

:help
cls
color 0F
title Commands - Dos 11
echo showing all commands...
echo settings: will open settings app
echo apps: tell you a list of apps that you can open
echo power: will tell you power options that you can use
echo exit: will shutdown dos 11
echo logout: will take you back to the sign in menu
echo time: will show the current time
echo Reboot: will close this session and open a new one
echo.
set /p PROGRAM=What do you want to do?: 
goto %PROGRAM%

:power
cls
color 4F
title Power options for host computer
ECHO Choose an option... (WARNING!!! THESE OPTIONS WILL RUN ON YOUR HOST COMPUTER!!!)
ECHO.
ECHO "1 = Logoff"
ECHO "2 = Reboot"
ECHO "3 = Hibernate"
ECHO "4 = Shutdown"
ECHO "5 = cancel"

SET /p option=Choose one option: 

IF %option%==1 SHUTDOWN /l
IF %option%==2 SHUTDOWN -r -t 10
IF %option%==3 SHUTDOWN /h
IF %option%==4 SHUTDOWN /s /f /t 0
IF %option%==5 goto Doshome

PAUSE

:apps
cls
color 0F
title App Launcher - %dosver%
echo showing all apps
echo settings
echo Changelog
echo Doshome
echo.
echo Or enter "exprogram" to search for a program that has been downloded
set /p PROGRAM=What app do you want to open?: 
goto %PROGRAM%
pause

:exit
cls
color 3F
title shutting down Dos 11
echo Goodbye!
pause
call thank.vbs
exit

:time
cls
title clock
echo %time%
pause
goto Doshome

:settings
call Settings.bat
goto Doshome

:exprogram
echo When entering an external program, you'll need to enter it's file name extention.
echo e.g. ".exe", ".bat" ".vbs", etc...
set /p exprogram=which external program do you want to open: 
call ..\Programs\%exprogram%
goto Doshome

:dscreen
cls
title dos crashed
echo %dosver% has crashed
echo.
echo error info below
for /f "delims=" %%c in (nessesities/crashinfo.txt) do (set crashinfo=%%c)
echo %crashinfo%
pause
call thank.vbs
exit

:Reboot
start dos-11.bat

:Changelog
call Changelog.txt
goto Doshome