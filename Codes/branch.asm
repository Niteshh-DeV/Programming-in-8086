.MODEL SMALL
.STACK 100H

.DATA
COUNT DB 05H

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, COUNT   ; loop counter
    MOV AL, 0       ; initialize AL

LOOP_START:
    ADD AL, 1       ; increment AL
    CMP AL, 3       ; compare AL with 3
    JE  EQUAL       ; jump if equal
    JMP NEXT_STEP

EQUAL:
    MOV BL, AL      ; store AL in BL if AL = 3

NEXT_STEP:
    LOOP LOOP_START ; decrement CX, loop if not zero

    MOV AH, 4CH     ; terminate program
    INT 21H

MAIN ENDP
END MAIN