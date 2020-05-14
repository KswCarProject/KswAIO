@echo off
Echo.
Echo. *****     This will replace Default apps with KswRedirector		*****
Echo. ***** 		   							*****
echo. *****		!!! Do use at your own risk !!!				*****
Echo. 
SET /p _IP= enter the ip adress of device (e.g. 192.168.0.1): 
@echo connecting to device ....
:pingloop
@echo If %_ip% can not be connected please check ip adress again.
timeout 2
ping -n 1 %_ip% |find "TTL=" || goto :pingloop
echo Answer received.
"%cd%\.config\adb" connect %_ip%:5555
"%cd%\.config\adb" root
"%cd%\.config\adb" remount
set _inputname=%_ip%:5555

:menu
cls
Echo.
Echo. *****     This will replace Default apps with KswRedirector		*****
Echo. ***** 		   							*****
echo. *****		!!! Do use at your own risk !!!				*****
Echo. 
Echo.  Enter "1" for replacing Browser app
Echo.  Enter "2" for replacing HD DVR app
Echo.  Enter "3" for replacing Easy Connect app
Echo.  Enter "4" for replacing Filemanager app + Installing Documents UI
Echo.  Enter "5" for copying redirects.xml to Headunit
echo.
set installer=
set /P installer= please select a Number or press Enter to end script 
echo.
IF "%installer%"=="1" GOTO :browser
IF "%installer%"=="2" GOTO :dvr
IF "%installer%"=="3" GOTO :easy 
IF "%installer%"=="4" GOTO :fcon
IF "%installer%"=="5" GOTO :redirectcopy
IF "%installer%" not defined GOTO :ende


:browser
echo. Uninstalling stock browser app
"%cd%\.config\adb" uninstall com.android.chrome
echo.
echo. installing replacement app
"%cd%\.config\adb" install "%cd%\resources/KswRedirect_browser_080520_1659.apk"
rem adb install apk/kswredirect/KswRedirect_browser_230420_0225.apk
echo. installation finished
pause press a key to go back to main menu

goto :menu

:dvr
echo. Uninstalling stock dvr app
"%cd%\.config\adb" uninstall com.ankai.cardvr
echo.
echo. installing replacement app
"%cd%\.config\adb" install "%cd%\resources/KswRedirect_dvr_230420_0153.apk"
echo. installation finished
pause press a key to go back to main menu

goto :menu

:easy
echo. Uninstalling stock Easy Connect app
"%cd%\.config\adb" uninstall net.easyconn
echo.
echo. installing replacement app
"%cd%\.config\adb" install "%cd%\resources/KswRedirect_phonelink_230420_0153.apk"
echo. installation finished
pause press a key to go back to main menu

goto :menu

:fcon
echo. Which Android Version does your System have, 9 or 10 ?
set /p OSver=
IF "%OSver%"=="9" GOTO :OS9
IF "%OSver%"=="10" GOTO :OS10
goto :noOS
:OS9
echo. Installing DocumentsUI for Android 9
"%cd%\.config\adb" install "%cd%\resources/DocumentsUI-9.apk"
goto :fileman
:OS10
echo. Installing DocumentsUI for Android 10
"%cd%\.config\adb" install "%cd%\resources/DocumentsUI-10.apk"

:fileman
echo. Uninstalling stock Filemanger app
"%cd%\.config\adb" uninstall com.estrongs.android.pop
echo.
echo. installing replacement app
"%cd%\.config\adb" install "%cd%\resources/KswRedirect_fe_230420_0225.apk"
echo. installation finished
pause press a key to go back to main menu

goto :menu

:noOS
Echo no or wrong OS Version entered
pause
goto :menu

:redirectcopy
echo. pushing redirects.xml 
"%cd%\.config\adb" push redirects.xml /storage/emulated/0
pause
goto :menu

:ende
echo. script ended

pause
