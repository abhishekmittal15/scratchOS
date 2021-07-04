#ifndef TEXTPRINT_H
#define TEXTPRINT_H
#endif 
#include "IO.cpp"
#include "typedefs.cpp"
#define VGA_MEMORY (unsigned char*)0xb8000
#define VGA_WIDTH 80
#define VGA_HEIGHT 25

uint_8 CursorPosition;

void setCursorPosition(uint_16 position){
    outb(0x3D4, 0x0F);
    outb(0x3D5, (uint_8)(position & 0xFF));
    outb(0x3D4, 0x0E);
    outb(0x3D5, (uint_8)((position >> 8) & 0xFF));

    CursorPosition = position;
}

uint_16 position(uint_8 x,uint_8 y){
    uint_16 pos = y * VGA_WIDTH + x;
    if(pos>2000 || pos<0)
        pos = 0;
    return pos;
}