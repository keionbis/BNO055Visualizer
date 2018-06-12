@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  BNO055Visualizer startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and BN_O055_VISUALIZER_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\smackx-3.2.1.jar;%APP_HOME%\lib\commons-math3-3.6.1.jar;%APP_HOME%\lib\libusb4java-1.2.0-linux-x86_64.jar;%APP_HOME%\lib\usb4java-1.2.0.jar;%APP_HOME%\lib\libusb4java-1.2.0-osx-x86.jar;%APP_HOME%\lib\hid4java-0.5.0.jar;%APP_HOME%\lib\miglayout-swing-4.1.jar;%APP_HOME%\lib\smack-3.2.1.jar;%APP_HOME%\lib\libusb4java-1.2.0-windows-x86_64.jar;%APP_HOME%\lib\jna-4.2.2.jar;%APP_HOME%\lib\usb-api-1.0.2.jar;%APP_HOME%\lib\libusb4java-1.2.0-linux-x86.jar;%APP_HOME%\lib\java-bowler-3.25.1.jar;%APP_HOME%\lib\libusb4java-1.2.0-osx-x86_64.jar;%APP_HOME%\lib\libusb4java-1.2.0-linux-arm.jar;%APP_HOME%\lib\commons-lang3-3.2.1.jar;%APP_HOME%\lib\BNO055Visualizer-1.0-SNAPSHOT.jar;%APP_HOME%\lib\miglayout-core-4.1.jar;%APP_HOME%\lib\libusb4java-1.2.0-windows-x86.jar;%APP_HOME%\lib\SimplePacketComsJava-0.1.6.jar;%APP_HOME%\lib\jama-1.0.2.jar;%APP_HOME%\lib\usb4java-javax-1.2.0.jar;%APP_HOME%\lib\commons-net-3.3.jar;%APP_HOME%\lib\nrjavaserial-3.12.1.jar

@rem Execute BNO055Visualizer
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %BN_O055_VISUALIZER_OPTS%  -classpath "%CLASSPATH%" com.BNO055.Visualizer.VisualizerController %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable BN_O055_VISUALIZER_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%BN_O055_VISUALIZER_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
