; Lab Task 7

include "emu8086.inc"
.model small
.stack 100h
.data
.code 
      printn "Enter an algebraic expression: " 
      mov cx, 0               ;to keep track of the stack 
      
take_input:               
      
      mov ah, 1               ;single key input
      int 21h                 ;input in al  
      cmp al, 0dh             ;comparing input with cret       
      je end_taking_input     ;if input is cret then goto end_taking_input 
           
      cmp al, '('             ;comparing al content with '('
      je push_into_stack      ;if input is ( then goto push_into_stack 
      
      cmp al, '{'             ;comparing al content with '{'
      je push_into_stack      ;if input is { then goto push_into_stack      
      
      cmp al, '['             ;comparing al content with '{'
      je push_into_stack      ;if input is { then goto push_into_stack
      
      cmp al, ')'             ;comparing al content with ')'
      je pop_1                ;if input is ) then goto pop_1 
      
      cmp al, '}'             ;comparing al content with '}'
      je pop_2                ;if input is } then goto pop_2 
      
      cmp al, ']'             ;comparing al content with ']'
      je pop_3                ;if input is ] then goto pop_3 
      
      jmp take_input

push_into_stack:
      xor ah, ah              ;clear ah
      push ax                 ;push input into the stack 
      inc cx
      jmp take_input          ;Goto take_input
      
pop_1:
      pop bx                  ;top element of stack is in bx
      cmp bx, '('             ;comparing popped element with (
      jne set_flag            ;if the popped element is not (, then goto set_flag
      jmp take_input

pop_2:
      pop bx                  ;top element of stack is in bx
      cmp bx, '{'             ;comparing popped element with {
      jne set_flag            ;if the popped element is not {, then goto set_flag 
      jmp take_input

pop_3:
      pop bx                  ;top element of stack is in bx
      cmp bx, '['             ;comparing popped element with [
      jne set_flag            ;if the popped element is not [, then goto set_flag  
      
      jmp take_input          ;Otherwise take another inputs 
      
set_flag:
      inc cx
      
end_taking_input:
      
      

print_yes:
      printn
      printn "Expression is correct." ;prints correct message 
      jmp exit 
      
print_no:
      printn
      printn "Incorrect expression."  ;prints incorrect message
      jmp exit    

exit:
      mov ah, 4ch
      int 21h