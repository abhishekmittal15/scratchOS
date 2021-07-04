#ifndef IO_H
#define IO_H
#endif

#include "typedefs.cpp"

void outb(uint_16 port,uint_8 val){
    asm volatile("outb %0, %1": : "a"(val),"Nd"(port));
}

uint_8 inb(uint_16 port){
    unsigned char returnVal;
    asm volatile("inb %1, %0"
                 : "=a"(returnVal)
                 : "Nd"(port));
    return returnVal;
}