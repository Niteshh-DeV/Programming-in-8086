; Program to Add Two 8-bit Numbers

DATA SEGMENT
    NUM1 DB 05H      ; First number
    NUM2 DB 03H      ; Second number
    SUM  DB ?        ; Variable to store sum
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA     ; Initialize data segment
    MOV DS, AX

    MOV AL, NUM1     ; Load first number into AL
    ADD AL, NUM2     ; Add second number to AL
    MOV SUM, AL      ; Store result in SUM

    ; (Optional) Display result using DOS interrupt
    MOV AH, 02H      ; DOS function to display character
    MOV DL, SUM      ; Move result to DL (not ASCII yet)
    ADD DL, 30H      ; Convert to ASCII
    INT 21H          ; Display result

    MOV AH, 4CH      ; Exit program
    INT 21H

CODE ENDS
END START