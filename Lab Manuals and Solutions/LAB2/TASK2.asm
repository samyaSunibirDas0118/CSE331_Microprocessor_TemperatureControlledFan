;DIRECTIVES

.MODEL SMALL            ;1 CODE, 1 DATA SEGMENT
.STACK 100H             ;USABLE OFFSET ADDRESS 000H - 100H
.DATA
.CODE


;INPUT:

MOV AH, 1H
INT 21H
MOV BL, AL              ;STORE AL VALUE IN BL   


MOV AH, 1H
INT 21H
MOV BH, AL              ;STORE AL VALUE IN BH


;OUTPUT:

MOV DL, 20H             ;DISPLAY SPACE
MOV AH, 2H
INT 21H

MOV DL, BL              ;PRINT STORED INPUT FROM BL
MOV AH, 2H
INT 21H 

MOV DL, BH              ;PRINT STORED INPUT FROM BH
MOV AH, 2H
INT 21H


;EXIT:

MOV AH, 4CH             ;TERMINATING/DOS EXIT FUNCTION
INT 21H                 ;INTERRUPT
                        ;USED TO RETURN CONTROL TO OS