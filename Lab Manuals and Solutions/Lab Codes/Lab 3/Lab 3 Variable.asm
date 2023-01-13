
; LAB 3 VARIABLE
.MODEL SMALL
.STACK 100H
.DATA 
     ; EVERY VARIABLE IS DECLARED HERE 
     VAR1 DB '4'
     VAR2 DW 38H
     VAR3 DB ?
     ;DB - DEFINE BYTE - 8BITS
     ;DW - DEFINE WORD - 16BITS  
     
.CODE
     MOV AX, @DATA ; ANY GENERAL PURPOSE REG CAN BE USED
    ;MOV BX, @DATA - MOV CX, @DATA
; @DATA - NAME OF THE SEGMENT ADDRESS OF DATA SEGMENT MEMORY  
     MOV DS, AX ; MAIN PURPOSE - MOV DS, @DATA
     
INPUT:
     MOV AH, 1H  ; SINGLE-KEY INPUT
     INT 21H
     MOV VAR3,AL 
     ; COPIES CONTENT OF AL TO THE MEMORY ADRESSED BY VAR3 
     
;ADDITION
     MOV BL, VAR1
     ADD VAR3, BL  
     ; SEGMENT TO SEGMENT TRANSFER NOT POSSIBLE
     ; DATA CANNOT BE TRANSFERRED DIRECTLY TO SEGMENT REGISTERS
     ; MEMORY TO MEMORY TRANSFER NOT POSSIBLE
     
OUTPUT:
     MOV AH, 2H
     MOV DL, VAR3
     INT 21H  
     
; VARIABLE MEMORY ACCESSING
     MOV AL, VAR1 ; DIRECT BY VARIABLE NAME
     
     MOV BL, 0H   ; JUST TO MAKE THE CONTENT OF BX 0000H
     MOV DL, [BX] ; MOV BL, [0000H] - VAR1
     INT 21H      ; BX, BP, SI, DI, 8/16 BIT NUMBER 
     
     ;AGAIN
     MOV BL, 1H
     MOV AX, [BX] ; VAR2 - WORD VARIABLE  
     
EXIT: ; EXIT FUNCTION
     MOV AH, 4CH
     INT 21H   