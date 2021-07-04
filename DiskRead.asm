PROGRAM_SPACE equ 0x8000 ; 0x7e00-0x7c00 is 512 bytes, so we are skipping over 1 sector and moving onto the next sector, remember 1 sector is 512 bytes. Later on we will change it to 0x8000 meaning we are skipping 1 Kb or 2 sectors now 

read_disk:
    mov ah,0x02 ; Setting the ah register to read the disk just like we set it to 0x0e to print something to screen
    mov bx,PROGRAM_SPACE
    mov al,32 ; Number of sectors to be read. Initially 4 were enough, but now since our kernel is in a separate executable created by the c file, we need to read more sectors, so we made it 32 
    mov dl,[Boot_disk]
    mov ch,0x00
    mov dh,0x00
    mov cl,0x02 ; We want to start reading from the 2nd sector as the bootloader is in the 1st sector

    int 0x13 ; interrupt to bios to read a disk, if successful sets the carry register to 0 else 1

    jc DiskError
    mov bx,DiskSuccessString
    call print 
    ret

Boot_disk:
    db 0

DiskSuccessString:
    db 'Successfully read the disk',0

DiskErrorString:
    db 'Failed to read the Disk',0

DiskError:
    mov bx,DiskErrorString
    call print
    jmp $