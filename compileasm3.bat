nasm bootloader.asm -f bin -o bootloader.bin 
nasm ExtendedProgram.asm -f elf64 -o ExtendedProgram.o
wsl $WSLENV/x86_64-elf-gcc -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "Kernel.o"
wsl /usr/local/x86_64elfgcc/x86_64-elf/bin/ld -o kernel.tmp -Ttext 0x7e00 ExtendedProgram.o Kernel.o
wsl /usr/local/x86_64elfgcc/x86_64-elf/bin/objcopy -O binary kernel.tmp kernel.bin 
copy /b bootloader.bin+kernel.bin bootloader.flp
pause