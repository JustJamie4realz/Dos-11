@echo off

:shome
cls
title Settings - %dosver%
echo type "help" for all settings commands
set /p setting=What setting do you want to open?: 
goto %setting%
call NA.vbs

:shelp
title settings help
echo showing all Settings
echo checkup: will check for updates (removed)
echo password: Goes into password section
echo display: Goes into display section (Not avaliable)
echo exit: exits the program
set /p setting=What setting do you want to open?: 
goto %setting%

:exit
exit

:password
cls
title password - Settings
echo Password section. What would you like to do?
echo 1 = Show Password
echo 2 = Change Password
echo 3 = back
echo.
SET /p option=Choose one option: 
IF %option%==1 goto spass
IF %option%==2 goto cpass
IF %option%==3 goto shome

:spass
cls
for /f "Delims=" %%a in (password.txt) do (set password=%%a)
echo current password: %password%
echo.
set /p box2=would you like to Change it? y/n: 
If %box2%=="y" goto cpass
If %box2%=="n" goto password

:cpass
cls
echo Change password
echo WARNING! Do not forget your password!
echo.
set /p pass=What would you like to Change your password to?: 
goto cpasscon

:cpasscon
cls
echo %pass% > password.txt
echo %pass%
echo.
set /p conformation=is this correct? y/n: 
if %conformation%=="y" goto password
if %conformation%=="n" goto cpass

:display
call SNA.vbs
goto shome