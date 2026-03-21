.MODEL SMALL
.STACK 100H
.DATA
binaryNum DB 45      ; Binary number to convert (0-99)
msg      DB 'Decimal: $'
asciiNum DB 2 DUP(?) ; To store ASCII digits
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX          ; Initialize data segment

    ; --- Binary to BCD conversion ---
    MOV AL, binaryNum
    MOV AH, 00H
    AAM 10               ; Divide AL by 10, AH = tens, AL = units

    ; Convert BCD digits to ASCII
    ADD AH, '0'          ; Tens digit
    ADD AL, '0'          ; Units digit
    MOV asciiNum, AH
    MOV asciiNum+1, AL

    ; Display message
    LEA DX, msg
    MOV AH, 09H
    INT 21H

    ; Display ASCII digits
    MOV CX, 2
    LEA SI, asciiNum
PRINT_LOOP:
    MOV DL, [SI]
    MOV AH, 02H
    INT 21H
    INC SI
    LOOP PRINT_LOOP

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN