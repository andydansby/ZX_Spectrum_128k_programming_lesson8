SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config;C:\Program Files\SDCC\bin

cls

cd utils
    copy "bas2tap.exe" "..\magic"
    copy "loader.bas" "..\magic"
    call bankloader.bat
cd ..


rem attention new
cd gfx
    copy "hotrod1.scr" "..\utils"
    copy "hotrod2.scr" "..\utils"
    copy "hotrod3.scr" "..\utils"
cd ..

rem attention new
cd utils
    zx0 -f hotrod1.scr hotrod1.zx0
    zx0 -f hotrod2.scr hotrod2.zx0
    zx0 -f hotrod3.scr hotrod3.zx0

    move "hotrod1.zx0" "..\RAM0"
    move "hotrod2.zx0" "..\RAM0"
    move "hotrod3.zx0" "..\RAM0"

    del "hotrod1.scr"
    del "hotrod2.scr"
    del "hotrod3.scr"
cd ..



cd CONTENDED
	call ramlow.bat
	move "contended.txt" "..\"
cd ..

cd RAM0
	call ram0.bat
	move "ram0.txt" "..\"
cd ..

cd RAM1
    call ram1.bat
    move "ram1.txt" "..\"
cd ..

cd RAM3
    call ram3.bat
    move "ram3.txt" "..\"
cd ..

cd RAM4
    call ram4.bat
    move "ram4.txt" "..\"
cd ..

cd RAM6
    call ram6.bat
    move "ram6.txt" "..\"
cd ..


cd UNCONTENDED
	call uncontended.bat
	move "uncontended.txt" "..\"
cd ..

echo on

move "contended.o" "OBJECTS\"
move "ram0.o" "OBJECTS\"
move "ram1.o" "OBJECTS\"
move "ram3.o" "OBJECTS\"
move "ram4.o" "OBJECTS\"
move "ram6.o" "OBJECTS\"
move "uncontended.o" "OBJECTS\"

cd OBJECTS
	call magic.bat
cd ..


cd UNCONTENDED
    call rammain.bat
cd ..


cd magic
    call voodoo.bat
cd ..


REM FINISHED COMPILE
call beep.bat
