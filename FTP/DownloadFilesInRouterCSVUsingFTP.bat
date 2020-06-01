@echo off
rem Set Date 
for /f "tokens=2-4* delims=/ " %%a in ('DATE /T') do set THEDATE=%%c%%a%%b
rem Routers.csv format
rem Device Name,Service IP,Username,Password,Source Directory,File Name,File Extension,Download Directory
rem read file routers.csv and download all files
for /f "usebackq tokens=1-8 delims=," %%a in ("Routers.csv") do (
      echo %%a %%b %%c %%d %%e %%f %%g %%h
	  CALL :GetFileFromRouter %%a , %%b , %%c , %%d , %%e , %%f , %%g , %%h
	  )

rem function to download file using ftp
:GetFileFromRouter

echo Getting file from Rouuter %~1 %~2 %~5%~6%~7

rem Original file path = Source Directory(%~5) + Original File Name(%~6) + File Extension(%~7)
echo from file %~5%~6%~7

rem new file = Download Directory(%~8) + Original File Name(%~6) + Device Name(%~1) + Date(%THEDATE%) + File Extension(%~7)
echo download to %~8%~6%~1%THEDATE%%~7

rem Download file using ftp to new with timestamp
echo open %~2 >> ftp &echo user %~3 %~4 >> ftp &echo binary >> ftp &echo get %~5%~6%~7 %~8%~6_%~1_%THEDATE%%~7 >> ftp &echo bye >> ftp &ftp -n -v -s:ftp &del ftp

EXIT /B 0