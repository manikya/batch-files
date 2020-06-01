echo off
rem Set Date variable
for /f "tokens=2-4* delims=/ " %%a in ('DATE /T') do set THEDATE=%%c%%a%%b
rem ZipDirectories.csv format
rem Source Directory,Desination Directory,Zip File Name,End Status Of Files In Source Directory 
rem read file ZipDirectories.csv and Zip all files
for /f "usebackq tokens=1-4 delims=," %%a in ("ZipDirectories.csv") do (
      echo %%a %%b %%c %%d 
	  CALL :ZipDirectory %%a , %%b , %%c , %%d 
	  )
	  
rem function to zip folders
:ZipDirectory

rem Convert the files in dirctory to a Zip file
7z a %~2%~3_%THEDATE%.zip -r %~1*

rem if the value DELETE_ORIGINAL given delete original files 
IF %~4==DELETE_ORIGINAL CALL :DeleteContentOfDirectory %~1

EXIT /B 0



:DeleteContentOfDirectory
echo Deleting origonal files
rem /Q - by pass confirm message  /s - delete sub dirctories
del /S /Q %~1\*

EXIT /B 0