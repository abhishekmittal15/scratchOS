#ifndef TEXTPRINT_H
#define TEXTPRINT_H
#endif 
#include "IO.cpp"
#define VGA_MEMORY (unsigned char*)0xb8000

unsigned char CursorPosition;

void setCursorPosition(unsigned short position){
    outb(0x3D4, 0x0F);
    outb(0x3D5, (unsigned char)(position & 0xFF));
    outb(0x3D4, 0x0E);
    outb(0x3D5, (unsigned char)((position >> 8) & 0xFF));

    CursorPosition = position;
}