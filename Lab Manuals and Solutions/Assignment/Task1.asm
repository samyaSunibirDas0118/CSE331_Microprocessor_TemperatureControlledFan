include "emu8086.inc"
.model small
.stack 100h
.data
zeroes dw ?
.code
    
    mov ax, @data
    mov ds, ax
    print "Enter a decimal Number: "
    call scan_num
    printn
    
    print "The binary is: "
    
    mov bx, 16
    
    _loop:
    shl cx, 1
    jc bin_1
    
    putc '0'
    
    dec bx
    add zeroes, 1
    
    jnz _loop
    jmp zero
    
    
    bin_1:
    putc '1'
    
    dec bx
    jnz _loop
    
    zero:
    printn
    print "The number of 0s is: "
    mov ax, zeroes
    call print_num
    
    
    
    
exit:
    mov ah, 4ch
    int 21h
    
;define
define_print_num
define_print_num_uns
define_scan_num