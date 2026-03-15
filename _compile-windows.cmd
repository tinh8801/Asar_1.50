g++ -o src\arch-65816.o -c -Os -DINTERFACE_CLI -Dstricmp=strcasecmp src\arch-65816.cpp
g++ -o src\arch-spc700.o -c -Os -DINTERFACE_CLI -Dstricmp=strcasecmp src\arch-spc700.cpp
g++ -o src\arch-superfx.o -c -Os -DINTERFACE_CLI -Dstricmp=strcasecmp src\arch-superfx.cpp
g++ -o src\assembleblock.o -c -Os -DINTERFACE_CLI -Dstricmp=strcasecmp src\assembleblock.cpp
g++ -o src\interface-cli.o -c -Os -DINTERFACE_CLI -Dstricmp=strcasecmp src\interface-cli.cpp
g++ -o src\interface-lib.o -c -Os -DINTERFACE_CLI -Dstricmp=strcasecmp src\interface-lib.cpp
g++ -o src\libcon.o -c -Os -DINTERFACE_CLI -Dstricmp=strcasecmp src\libcon.cpp
g++ -o src\libsmw.o -c -Os -DINTERFACE_CLI -Dstricmp=strcasecmp src\libsmw.cpp
g++ -o src\libstr.o -c -Os -DINTERFACE_CLI -Dstricmp=strcasecmp src\libstr.cpp
g++ -o src\macro.o -c -Os -DINTERFACE_CLI -Dstricmp=strcasecmp src\macro.cpp
g++ -o src\main.o -c -Os -DINTERFACE_CLI -Dstricmp=strcasecmp src\main.cpp
g++ -o src\math.o -c -Os -DINTERFACE_CLI -Dstricmp=strcasecmp src\math.cpp
g++ -o src\mathlib.o -c -Os -DINTERFACE_CLI -Dstricmp=strcasecmp src\mathlib.cpp
g++ -o asar src\arch-65816.o src\arch-spc700.o src\arch-superfx.o src\assembleblock.o src\interface-cli.o src\interface-lib.o src\libcon.o src\libsmw.o src\libstr.o src\macro.o src\main.o src\math.o src\mathlib.o
pause