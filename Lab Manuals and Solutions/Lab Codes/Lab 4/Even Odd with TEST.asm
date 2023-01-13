; LAB4 - EVEN ODD TEST

.MODEL SMALL
.STACK 100H
.DATA
.CODE
     ;TEST IS EQUIVALENT TO AND OPERATIONS
     ;IT ONLY AFFECTS THE FLAG REGISTER   
     
     ;EVEN NUMBERS 0,10,100,110,1000 HAVE 0 IN LSB
     ;ODD NUMBERS 1,11,101,111 HAVE 1 IN LSB
     
     MOV AH, 1H
     INT 21H     ;SINGLE-KEY INPUT
     
     TEST AL,1H  ;TO CHECK EVEN ODD
     JZ EVEN     ;JUMP TO EVEN IS Z-FLAG IS 0
     
     MOV AH, 2H
     MOV DL, 'O'
     INT 21H
     JMP EXIT
     
EVEN:
     MOV AH, 2H
     MOV DL, 'E'
     INT 21H
      
     ;FOR 4, 0000 0100
     ;  TEST 0000 0001
     ;----------------
     ;       0000 0000 AS LSB IS 0, SO 4 IS EVEN
     ;FOR 5, 0000 0101
     ;  TEST 0000 0001
     ;----------------
     ;       0000 0001 AS LSB IS 1, SO 5 IS ODD
           
EXIT:
      MOV AH, 4CH
      INT 21H