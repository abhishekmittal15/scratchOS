[org 0x7c00]

mov [Boot_disk],dl
mov bp,0x7c00
mov sp,bp 

mov bx,greeting
call print
call read_disk

jmp PROGRAM_SPACE

%include "print.asm"
%include "DiskRead.asm"

greeting:
    db 'Hello World',0

times 510-($-$$) db 0
dw 0xaa55
