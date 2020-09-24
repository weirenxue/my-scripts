@echo off
REM 先創建一個空的txt
copy /y nul Table_ALL_Create.txt > nul

REM tokens=3,指的是由delims分割符分割後的第三個

REM delims=; ,注意有空白鍵,代表是以分號與空白鍵當分割符

FOR /F "tokens=3 delims=; " %%i in (Table_ALL_Drop.sql) DO (
	echo Table_%%i_Create.sql>> tmp.txt
	type Table_ALL_Create.txt>> tmp.txt
	del Table_ALL_Create.txt
	ren tmp.txt Table_ALL_Create.txt
) 

copy /y nul Table_ALL_Create.sql > nul
FOR /F "tokens=* delims=; " %%i in (Table_ALL_Create.txt) DO (
	type %%i>> Table_ALL_Create.sql 
	echo.>> Table_ALL_Create.sql  
	echo.>> Table_ALL_Create.sql 
) 

del Table_ALL_Create.txt
