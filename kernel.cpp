#include "textprint.cpp"
#include "typedefs.cpp"

extern "C" void _start(){
    // setCursorPosition(0); // Beginning of the screen
    // setCursorPosition(12 * 80 + 80 / 2); // Middle of the screen(which has 80 columns and 25 rows)
    setCursorPosition(position(40, 3)); // Sets the cursor to the 3rd row and 40th column
    return;
}