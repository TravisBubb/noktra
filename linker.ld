/* Entry Point */
ENTRY(reset_handler)

/* Highest address of the user mode stack */
_estack = ORIGIN(RAM) + LENGTH(RAM); /* end of "RAM" Ram type memory */

_Min_Heap_Size = 0x200; /* required amount of heap */
_Min_Stack_Size = 0x400; /* required amount of stack */

/* Memories definition */
MEMORY
{
  FLASH  (rx)     : ORIGIN = 0x08000000,   LENGTH = 512K
  RAM    (xrw)    : ORIGIN = 0x20000000,   LENGTH = 128K
}

SECTIONS
{
    .isr_vector :
    {
        KEEP(*(.isr_vector))    /* vector table */
    } > FLASH

    .text :
    {
        *(.text)
        *(.text*)
    } > FLASH

    .rodata :
    {
        *(.rodata)
        *(.rodata*)
    } > FLASH

    .data : AT (_etext)
    {
        _sdata = .;
        *(.data)
        *(.data*)
        _edata = .;
    } > RAM

    .bss :
    {
        _sbss = .;
        *(.bss)
        *(.bss*)
        *(COMMON)
        _ebss = .;
    } > RAM

    _etext = LOADADDR(.data);
}
