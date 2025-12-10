.MODEL SMALL
.STACK 100h

.DATA
NUM1 DB 06h     ; First number
NUM2 DB 03h     ; Second number
RESULT DW ?     ; 16-bit result

.CODE
MAIN:
    MOV AX, @DATA   ; Initialize data segment
    MOV DS, AX
    
    MOV AL, NUM1    ; Load first number into AL
    MOV BL, NUM2    ; Load second number into BL
    
    MUL BL          ; AL × BL → AX (result in AX)
    
    MOV RESULT, AX  ; Store 16-bit result
    
    ; Display result
    MOV AX, RESULT  ; Load result into AX
    MOV BX, 10      ; Divisor for decimal conversion
    MOV CX, 0       ; Counter for digits
    
LOOP_DIVIDE:
    XOR DX, DX      ; Clear DX
    DIV BX          ; AX ÷ 10, quotient in AX, remainder in DX
    PUSH DX         ; Push remainder (digit)
    INC CX          ; Increment digit count
    CMP AX, 0       ; Check if quotient is zero
    JNE LOOP_DIVIDE
    
LOOP_PRINT:
    POP DX          ; Pop digit
    ADD DL, 30h     ; Convert to ASCII
    MOV AH, 02h     ; INT 21h function for character output
    INT 21h         ; Display character
    LOOP LOOP_PRINT
    
    MOV AH, 4Ch     ; Exit program
    INT 21h
    
END MAIN