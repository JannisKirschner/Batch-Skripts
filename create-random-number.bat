rem To generate a random number use %RANDOM%
rem You can change the size with set /a
rem Some examples

echo 'Your random number:' %RANDOM%

rem random number multiplied by another random number
SET /A test=%RANDOM% * %RANDOM%

rem range 0-99
SET /A test=%RANDOM%  %%100

rem range 1-100
SET /A test=%RANDOM% %%100 + 1
