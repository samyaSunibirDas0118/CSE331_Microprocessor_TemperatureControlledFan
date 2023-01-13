;DIRECTIVES

.MODEL SMALL            ;1 CODE, 1 DATA SEGMENT
.STACK 100H             ;USABLE OFFSET ADDRESS 000H - 100H
.DATA
    v1 DB "c$"
    v2 DB  ?, '$'

.CODE
    MOV AX, @DATA
    MOV DS, AX


    LEA DX, v1          ;DX ONLY FOR STRING
    MOV AH, 9H          ;9H STRING OUTPUT
    INT 21H
    
    
    SUB v1,20H
    MOV BL, v1
    
    MOV v2, BL
    
    MOV AH, 2                    ; carriage return 
    MOV DL, 0DH
    INT 21H

    MOV DL, 0AH                  ; next line
    INT 21H   
    
    
    
    LEA DX, v2          ;DX ONLY FOR STRING
    MOV AH, 9H          ;9H STRING OUTPUT
    INT 21H
   
    
       
    
    
    




;EXIT:

MOV AH, 4CH             ;TERMINATING/DOS EXIT FUNCTION
INT 21H                 ;INTERRUPT
                        ;USED TO RETURN CONTROL TO OS