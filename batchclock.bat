rem Author: Jannis Kirschner
rem Copyright: (c) Jannis Kirschner, 2017
rem Licence: GPL 3
rem Version: 0.2.1



@ECHO OFF


rem main
:main


	rem Great ASCII Art by  http://patorjk.com/software/taag/
	echo "***************************************************"
	echo " ____        _       _          _            _    "
	echo "| __ )  __ _| |_ ___| |__   ___| | ___   ___| | __"
	echo "|  _ \ / _` | __/ __| '_ \ / __| |/ _ \ / __| |/ /"
	echo "| |_) | (_| | || (__| | | | (__| | (_) | (__|   < "
	echo "|____/ \__,_|\__\___|_| |_|\___|_|\___/ \___|_|\_\"
	echo "                                  github.com/JannisKirschner"
	echo "***************************************************"


	echo "1 = Enter Time to wake"
	echo "2 = Enter Countdown   "
	echo "3 = Stopwatch         "
	echo "e = Exit              "
	echo.
	
	set /p clockmode="Please select a clockmode: "

	if /i %clockmode%== 1  goto waketime
	if /i %clockmode%== 2  goto countdown
	if /i %clockmode%== 3  goto stopwatch
	if /i %clockmode%=="e" goto exit
	



	rem eof
	:exit
		echo.
		echo "Goodbye!"
		echo "Thanks for using my script"
		echo.
		pause
exit




rem Waketime implementation compares if time matches waketime and exits if true
:waketime
	echo.
	echo "Welcome to waketime..."
	echo "Wake with sound or browser?"
	set /p soundchoice="1=File/2=Browser: "
	if /i %soundchoice%== 1  goto file
	if /i %soundchoice%== 2  goto browser
	goto :waketime


	:file
		set /p soundfile="Drag&Drop File Path: "
	goto clock



	:browser
		set /p website="Enter Link: "
	goto clock


	:clock
		echo "Enter waketime (00:00:00.00) Hours:Mins:Secs.Milisecs"
		echo.
		set /p waketime="Waketime: "
			:notwaketime

			if /i %time% == %waketime% goto timeup
				echo %time%       %waketime%
			goto :notwaketime


		:timeup
			echo "***********"
			echo "Time's up!"
			echo.
			echo.
			if /i %soundchoice%== 1  start %soundfile%
			if /i %soundchoice%== 2  start "" %website%
goto main




rem Countdown implementation
:countdown
	echo.
	echo "Nothing to see here...yet"
goto main



rem Stopwatch implementation
:stopwatch
	echo.
	echo "Welcome to stopwatch..."
	set /p starttimetrigger="Press enter to start/stop"
	rem if /i %soundchoice%==""  goto startcountdown
	rem goto main
	:startcountdown
		set starttime= %time%
		set /p endtimetrigger=""
		set endtime= %time%
		for /f "tokens=1,2,3,4 delims=:. " %%a in ("%starttime%") do set shr=%%a&set smin=%%b&set ssec=%%c&set smsec=%%d&set > nul
		for /f "tokens=1,2,3,4 delims=:. " %%a in ("%endtime%") do set ehr=%%a&set emin=%%b&set esec=%%c&set emsec=%%d&set > nul
			
		set /a hr=%ehr%-%shr%
		set /a min=%emin%-%smin%
		set /a sec=%esec%-%ssec%	
		set /a msec=%emsec%-%smsec%
		echo.
		echo "Time passed: "
		echo %hr%  %min% %sec%  %msec% 
		
			
		echo.
		echo.
		echo "Starttime: "%starttime% 
		echo "Endtime: "%endtime%
		echo.
		echo.
		echo.
	
goto main

goto main





