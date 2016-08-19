;Coded By : Mohamed El Sayed
;www.ionerds.com	-	2016     
;MASMCALC.ASM
;Output : .EXE
;MASM v 5.00 compatible code
;
; NASM MASMCALC.ASM;
; LINK CALC;   
;
;(DONT FORGET THE SEMICOLON)


.MODEL TINY
.STACK 64
.DATA
X   DB  0
Y   DB  0
R   DB  0
NL  DB  0,13,10,'$'
STNUM   DB  "ENTER THE FIRST NUMBER : $"
NDNUM   DB  "ENTER THE SECOND NUMBER : $"
RESULT  DB  "RESULT IS : $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 09H
    LEA DX, STNUM
    INT 21H
    
    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV X, AL
    
    MOV AH, 09H
    LEA DX, NL
    INT 21H
    
    LEA DX, NDNUM
    INT 21H
    
    MOV AH, 01H
    INT 21H
    
    SUB AL, '0'
    MOV Y, AL
    
    MOV DL, Y
    ADD DL, X
    MOV R, DL
    ADD R, '0'
    
    MOV AH, 09H
    LEA DX, NL
    INT 21H
    
    LEA DX, RESULT
    INT 21H
    LEA DX, R
    INT 21H
    
    MOV AX, 4C00H
    INT 21H
    
    
END
END MAIN
