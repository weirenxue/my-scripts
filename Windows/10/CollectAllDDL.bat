@echo off
setlocal enabledelayedexpansion 
set list[1]=Privilege
set list[2]=Department
set list_len=2


for /l %%n in (1,1,%list_len%) do ( 
	set dir=.\!list[%%n]!_Related\DDL
	copy /y nul !dir!\Table_ALL_Create.txt > nul
	del !dir!\tmp.txt > nul 2>&1
	for /F "tokens=3 delims=; " %%i in (!dir!\Table_ALL_Drop.sql) do (
		echo !dir!\Table_%%i_Create.sql>> !dir!\tmp.txt
		type !dir!\Table_ALL_Create.txt>> !dir!\tmp.txt
		del !dir!\Table_ALL_Create.txt
		ren !dir!\tmp.txt Table_ALL_Create.txt
	)
	copy /y nul !dir!\Table_ALL_Create.sql > nul
	for /F "tokens=* delims=; " %%i in (!dir!\Table_ALL_Create.txt) DO (
		type %%i>> !dir!\Table_ALL_Create.sql 
		echo.>> !dir!\Table_ALL_Create.sql  
		echo.>> !dir!\Table_ALL_Create.sql 
	)
	del !dir!\Table_ALL_Create.txt
	echo !dir! ... done^^!
)

copy /y nul Table_ALL_Create.sql > nul
for /l %%n in (1,1,%list_len%) do ( 
	set dir=.\!list[%%n]!_Related\DDL
	type !dir!\Table_ALL_Create.sql>> Table_ALL_Create.sql 
)

copy /y nul Table_ALL_Drop.sql > nul
for /l %%n in (%list_len%,-1,1) do ( 
	set dir=.\!list[%%n]!_Related\DDL
	type !dir!\Table_ALL_Drop.sql>> Table_ALL_Drop.sql 
	echo.>> Table_ALL_Drop.sql
)




pause
