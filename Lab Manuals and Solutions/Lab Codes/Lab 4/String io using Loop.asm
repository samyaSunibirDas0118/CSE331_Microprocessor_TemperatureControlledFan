
;LAB 4 - STRING INPUT OUTPUT USING LOOP
.MODEL SMALL
.STACK 100H
.DATA
      STR DB 12 DUP(?),'$'
.CODE

      MOV AX, @DATA
      MOV DS, AX
      
      MOV SI, 0H
      MOV AH, 1H
      MOV CX, 12
      
INPUT:
      INT 21H
      MOV STR[SI], AL
      INC SI
LOOP INPUT
      
      MOV AH, 2H
      MOV SI, 0H
      MOV DL, 0AH
      INT 21H
      MOV DL, 0DH
      INT 21H 
      MOV CX, 12 
      
OUTPUT:
      MOV DL, STR[SI]
      INT 21H
      INC SI   
LOOP OUTPUT
      
EXIT:
      MOV AH, 4CH
      INT 21H      