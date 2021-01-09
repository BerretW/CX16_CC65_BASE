del .\output\*.*

cd .\src
ca65 --cpu 6502 main.asm -o ..\output\main.o


move *.s ..\output

cd ..\output



ld65 -C cx16.cfg cx16.lib -m main.map main.o -o ..\output\HW.prg
"e:\soft\x16emu_win-r38\x16emu.exe" -prg HW.prg
