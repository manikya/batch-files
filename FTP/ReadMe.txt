Created By - Tharindu Janaraj

Zip Folders Batch file needs 7Zip intalled in the machine
download link - https://www.7-zip.org/

Then add C:\Program Files\7-Zip to the System Environment Variable PATH
EnvironmntVariables->Path->Edit-> add new line C:\Program Files\7-Zip


Routers file contains data on servers and files to be downloaded. 
Routers.csv format
Device Name,Service IP,Username,Password,Source Directory,File Name,File Extension,Download Directory

ZipDirectories file contains data on directoris to be converted to zip
ZipDirectories.csv format
Source Directory,Desination Directory,Zip File Name,End Status Of Files In Source Directory(DELETE_ORIGINAL/KEEP_ORIGINAL)



