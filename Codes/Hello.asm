.model small
.stack 100h
.data
msg db "Hello, 8086 World!$"
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, msg
    int 21h

    mov ah, 4Ch
    int 21h
main endp
end main