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
    /* The vector table goes at the start of flash. */
    .vector_table :
    {
        . = ALIGN(4);
        KEEP(*(.vector_table))    /* vector table */
        . = ALIGN(4);
    } > FLASH

    /* The 'text' section contains the main program code. */
    .text :
    {
        . = ALIGN(4);
        *(.text)
        *(.text*)
        . = ALIGN(4);
    } > FLASH

    /* The 'rodata' section contains read-only data,
     * constants, strings, information that won't change. */
    .rodata :
    {
        . = ALIGN(4);
        *(.rodata)
        *(.rodata*)
        . = ALIGN(4);
    } > FLASH

    /* The 'data' section is space set aside in RAM for
     * things like variables, which can change. */
    _sidata = .;
    .data : AT (_sidata)
    {
        . = ALIGN(4);
        _sdata = .;     /* Mark start of data section */
        *(.data)
        *(.data*)
        _edata = .;     /* Mark end of data section */
        . = ALIGN(4);
    } > RAM

    /* The 'bss' section is similar to the 'data' section,
     * but its space is initialized to all 0s at the
     * start of the program. */
    .bss :
    {
        . = ALIGN(4);
        _sbss = .;      /* Mark start of BSS section */
        *(.bss)
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;      /* Mark end of BSS section */
    } > RAM

    /* Space set aside for the application's heap/stack. */
    .dyanmic_allocations :
    {
        . = ALIGN(4);
        _ssystem_ram = .;   /* Mark start of system ram section */
        . = . + _Min_Stack_Size;
        . = ALIGN(4);
        _esystem_ram = .;   /* Mark end of system ram section */
    } > RAM

    _etext = LOADADDR(.data);
}
