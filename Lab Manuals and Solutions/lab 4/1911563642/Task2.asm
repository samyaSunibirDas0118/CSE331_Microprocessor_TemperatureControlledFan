.MODEL SMALL
.STACK 100h
.DATA
    A DB 100 DUP (?), '$'
.CODE
    MOV AX, @DATA
    MOV DS, AX
    MOV AH, 1
    LEA SI, A
    INPUT:
    INT 21H
    
    CMP AL, 0DH
    JE EXIT
    
    
    JNZ INPUT
    
    EXIT:
    MOV AH, 4CH
    INT 21H