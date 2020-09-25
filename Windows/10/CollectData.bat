@echo off
setlocal enabledelayedexpansion 
set list[1]=Privilege
set list[2]=Department
set list_len=2


for /l %%n in (1,1,%list_len%) do ( 
	set DDLdir=.\Related_!list[%%n]!\DDL
	set dir=.\Related_!list[%%n]!\DML
	copy /y nul !dir!\Data_ALL.txt > nul
	del !dir!\tmp.txt > nul 2>&1
	for /F "tokens=5 delims=; " %%i in (!DDLdir!\Table_ALL_Drop.sql) do (
		echo !dir!\%%i.sql>> !dir!\tmp.txt
		type !dir!\Data_ALL.txt>> !dir!\tmp.txt
		del !dir!\Data_ALL.txt
		ren !dir!\tmp.txt Data_ALL.txt
	)
	copy /y nul !dir!\Data_ALL.sql > nul
	for /F "tokens=* delims=; " %%i in (!dir!\Data_ALL.txt) DO (
		if exist %%i (
			type %%i>> !dir!\Data_ALL.sql 
			echo.>> !dir!\Data_ALL.sql  
			echo.>> !dir!\Data_ALL.sql
		)
	)
	del !dir!\Data_ALL.txt
	echo !dir! ... done^^!
)

copy /y nul Data_ALL.sql > nul
for /l %%n in (1,1,%list_len%) do ( 
	set dir=.\Related_!list[%%n]!\DML
	type !dir!\Data_ALL.sql>> Data_ALL.sql
)
pause
