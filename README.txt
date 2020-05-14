====================================================
KswRedirect - Redirection Apps for Android Headunits
v2.1 (May 8, 2020)

by @nicholaschum on XDA-Developers/Bimmerpost/GitHub
====================================================

For installing Files you can start KswRedirect_installer.bat and follow the instructions shown

You can decide which APK to install depending on your usage (can install all or one):
- KswRedirect_browser_XXXXXX_YYYY.apk (Web Browser redirect - DEFAULT: CHROME)
- KswRedirect_dvr_XXXXXX_YYYY.apk (DVR redirect - DEFAULT: HD DVR)
- KswRedirect_fe_XXXXXX_YYYY.apk (File explorer redirect - DEFAULT: ES FILE EXPLORER)
- KswRedirect_phonelink_XXXXXX_YYYY.apk (PhoneLink redirect - DEFAULT: EASYCONNECT)


To configure which app to redirect to, you will have to launch one of the apps above installed, 
grant it storage permissions, then using a file browser, navigate to /storage/emulated/0 
(usually it's your Internal storage) and then open redirects.xml.

You can then edit each item to be redirected. Only edit the value rather than the keys (e.g. com.android.chrome is a key).


If you have any problems, message me on one of the platforms above.


================================
Browser Hijack Full Instructions
================================
adb root
adb remount
adb shell
	rm -rf /system/app/Chrome
adb reboot