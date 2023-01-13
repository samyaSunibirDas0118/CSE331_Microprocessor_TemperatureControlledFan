include "emu8086.inc"
.model small
.stack 100h
.data
    
.code
    mov ax, @data
    mov ds, ax
    
    print "Your Input n: "
    call scan_num
    printn
    
    mov ax, cx      ;n moved to ax
    
    cmp ax, 250d    ;limits
    jg exit
    cmp ax, 0d
    jl exit
    
    mov si, cx
    
    mul ax          ;n^2
    
    add ax, si      ;n^2+n
    
    add ax, 2       ;n^2+n+2
    
    mov bx, 2       
    div bx          ;(n^2+n+2)/2
     
    print "The output is: "
    call print_num  ;print value in ax
    
    exit:
    mov ah, 4ch
    int 21h

;define
    define_scan_num
    define_print_num
    define_print_num_uns
    
