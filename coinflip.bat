@ECHO OFF


rem github.com/JannisKirschner
rem simple script to flip a coin in cmd

echo "*****************************"
echo "      Welcome to Coinflip    "
echo "      -Just flip a coin-     "
echo "     !!!!!NOW in CMD!!!!!    "
echo "                             "
echo "*****************************"
echo.
echo "Press q to quit"
echo.
echo.

:main


set /p enter="Press enter to flip: "

SET /A flip=%RANDOM% * 2 / 32768 + 1


if /i %flip%==1 echo "Heads"
if /i %flip%==2 echo "Tails"


goto main



:eof
echo "Goodbye!" 
