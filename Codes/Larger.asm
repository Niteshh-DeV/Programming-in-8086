; Program to find the largest of two numbers

DATA SEGMENT
    NUM1 DB 25H       ; First number
    NUM2 DB 3AH       ; Second number
    LARGE DB ?        ; To store the largest
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA
    MOV DS, AX

    MOV AL, NUM1      ; Load first number into AL
    MOV BL, NUM2      ; Load second number into BL

    CMP AL, BL        ; Compare AL and BL
    JAE L1            ; Jump if AL >= BL
    MOV LARGE, BL     ; Otherwise BL is larger
    JMP DISPLAY

L1: MOV LARGE, AL     ; AL is larger

DISPLAY:
    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    MOV DL, LARGE     ; Move largest number into DL
    ADD DL, 30H       ; Convert to ASCII (only works if <10)
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H

MSG DB "Largest Number: $"

CODE ENDS
END START