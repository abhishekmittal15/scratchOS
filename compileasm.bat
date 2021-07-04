nasm bootloader.asm -f bin -o bootloader.bin 
nasm ExtendedProgram.asm -f elf64 -o ExtendedProgram.o
wsl $WSLENV/x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c "kernel.cpp" -o "kernel.o"
wsl /usr/local/x86_64elfgcc/x86_64-elf/bin/ld -T"link.ld"
@REM wsl /usr/local/x86_64elfgcc/x86_64-elf/bin/objcopy -O binary kernel.tmp kernel.bin 
copy /b bootloader.bin+kernel.bin bootloader.flp
pause