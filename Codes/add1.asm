; Program to add two 8-bit numbers in 8086

.model small
.stack 100h
.data
    num1 db 05h       ; First number
    num2 db 03h       ; Second number
    result db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, num1      ; Load first number into AL
    add al, num2      ; Add second number
    mov result, al    ; Store result

    ; Display result (convert to ASCII)
    mov ah, 02h
    mov dl, result
    add dl, 30h       ; Convert to ASCII
    int 21h           ; Print result on screen

    mov ah, 4Ch
    int 21h           ; Exit program
main endp
end main