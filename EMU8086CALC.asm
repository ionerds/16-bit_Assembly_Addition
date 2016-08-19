;Coded By : Mohamed El Sayed
;www.ionerds.com	-	2016     
;EMU8086CALC.ASM
;EMU8086 v 4.08 compatible code
;Output : .COM - .EXE

;un-comment the next line to create .EXE file, leave it commented to create .COM file | NOTE : .EXE is not tested |
;#MAKE_EXE#
.MODEL TINY
.CODE   
JMP MAIN   
;<===(TELETYPE METHOD)===>

PRINT:    LODSB
          CMP AL, '$'
          JE DONE
          MOV AH, 0EH
          INT 10H
          JMP PRINT    
DONE:     RET      

MAIN PROC
    ; MOV AH, 09H       ;| PRINTING USING DOS CALL AH 09H INT 21H
    ; LEA DX, STNUM     ;|
    ; INT 21H           ;|      
    
    LEA SI, STNUM       ;|PRINTING USING PRINT FUNCTION
    CALL PRINT          ;|TELETYPE PRINTING
    
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
ENDP
X   DB  0 ,13,10,"$"
Y   DB  0 ,13,10,"$"
R   DB  0 ,13,10,"$"
NL  DB  " ",13,10,'$'
STNUM   DB  "ENTER THE FIRST NUMBER : $"
NDNUM   DB  "ENTER THE SECOND NUMBER : $"
RESULT  DB  "RESULT IS : $"
END MAIN