.STACK 100h
.DATA

digit_output DB ' your input character is a digit$'

.CODE


MOV AH, 01h
INT 21h

MOV BL, AL   ; move input to BL

CMP BL, 30h  ; Comparison between BL, 0's Ascii
JMP Logic    ; If >=, jump to Logic

Logic:       

CMP BL, 39h  ; Comparison between BL, 9's Ascii
JLE Output   ; If <=, jump to Output
JMP END       

       
Output:
MOV AX, @DATA
MOV DS, AX
MOV AH, 09H
LEA DX, digit_output
INT 21H
 
END:
 
MOV AH, 4CH
INT 21H