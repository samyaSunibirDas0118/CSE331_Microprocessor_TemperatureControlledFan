;DIRECTIVES

.MODEL SMALL            ;1 CODE, 1 DATA SEGMENT
.STACK 100H             ;USABLE OFFSET ADDRESS 000H - 100H
.DATA
.CODE


;INPUT:

MOV AH, 1H
INT 21H
MOV BH, AL              

MOV AH, 1H
INT 21H
MOV BL, AL              




 

SUB BH,30h
SUB BL,30h
SUB BH, BL
ADD BH, 30h


;OUTPUT:

MOV AH, 2                    ; carriage return 
MOV DL, 0DH
INT 21H

MOV DL, 0AH                  ; next line
INT 21H

MOV DL, BH              ;PRINT STORED INPUT FROM BL
MOV AH, 2H
INT 21H 




;EXIT:

MOV AH, 4CH             ;TERMINATING/DOS EXIT FUNCTION
INT 21H                 ;INTERRUPT
                        ;USED TO RETURN CONTROL TO OS