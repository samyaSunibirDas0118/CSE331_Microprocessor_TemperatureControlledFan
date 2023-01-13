
include "emu8086.inc"
.model small
.stack 100h
.data
.code 

;taking input until enter is pressed
      mov cx, 0
      print "Enter a line of text: "
input:
      mov ah, 1h
      int 21h
      cmp al, 0dh ;check if it is CRET
      je print_newLine
      
      inc cx
      xor ah, ah ;clear ah
      push ax    ;push input into the stack
      jmp input

print_newLine:
      printn
      jmp display
      
display:
      ;print reverse 
      cmp cx, 0 ;check if the stack is empty
      je empty_stack
      pop dx
      mov ah, 2
      int 21h
loop display      
      
empty_stack:
      printn
      printn "The stack is empty"          

exit:
      mov ah, 4ch
      int 21h
