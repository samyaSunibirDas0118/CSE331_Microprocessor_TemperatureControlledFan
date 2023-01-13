include 'EMU8086.INC'
.model small
.stack 100h
.data
    prompt1 db 'enter a number: ', 0
    prompt2 db 0ah, 0dh, 'enter another number: ', 0
    
.code
    mov ax, @data
    mov ds, ax
    
    lea si, prompt1
    call print_string
    call scan_num
    
    mov ax, cx
    
    lea si, prompt2
    call print_string
    call scan_num
    
    sub ax,cx
    
    call pthis
    db 13, 10, 'The difference is: ', 0
    
    call print_num
    
    exit:
    mov ah, 4ch
    int 21h

;define
    define_scan_num
    define_print_string
    define_print_num
    define_print_num_uns
    define_pthis
    
end