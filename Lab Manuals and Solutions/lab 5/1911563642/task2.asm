include 'EMU8086.INC'
.model small
.stack 100h
.data
.code
    print '0 '
    mov ax, 1
    mov bx, 0
    mov dx, 0
    
    mov cx, 14
    
logic:
    add ax, bx
    call print_num
    putc ' '
    
    mov dx, ax
    mov ax, bx
    mov bx, dx
    
    loop logic
    
    exit:
    mov ah, 4ch
    int 21h 
    
   

;define
    
    define_print_num
    define_print_num_uns
    
    
end