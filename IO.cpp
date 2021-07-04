#ifndef IO_H
#define IO_H
#endif

void outb(unsigned short port,unsigned char val){
    asm volatile("outb %0, %1": : "a"(val),"Nd"(port));
}

unsigned char inb(unsigned port){
    unsigned char returnVal;
    asm volatile("inb %1, %0"
                 : "=a"(returnVal)
                 : "Nd"(port));
    return returnVal;
}