;DIRECTIVES

.MODEL SMALL            ;1 CODE, 1 DATA SEGMENT
.STACK 100H             ;USABLE OFFSET ADDRESS 000H - 100H
.DATA
    a1 DB 3H, 4H, 5H, 6H, 7H
    a2 DB 5 DUP(?)
.CODE
MOV AL  , a1[0]    
MOV a2[0], AL

MOV AL  , a1[1]    
MOV a2[1], AL

MOV AL  , a1[2]    
MOV a2[2], AL

MOV AL  , a1[3]    
MOV a2[3], AL

MOV AL  , a1[4]    
MOV a2[4], AL



      






;EXIT:

MOV AH, 4CH             ;TERMINATING/DOS EXIT FUNCTION
INT 21H                 ;INTERRUPT
                        ;USED TO RETURN CONTROL TO OS