rem Author: Jannis Kirschner
rem Copyright: (c) Jannis Kirschner, 2017
rem Licence: GPL 3
rem Version: 0.1.0



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
	echo "Nothing to see here...yet"

goto main





