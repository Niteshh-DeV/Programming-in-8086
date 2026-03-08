; add.asm - 8086 (MASM/TASM) program to add two decimal numbers (DOS)
; Reads two decimal numbers (up to 5 digits), computes sum and prints result.

.model small
.stack 100h
.data
prompt1  db 'Enter first number: $'
prompt2  db 13,10,'Enter second number: $'
resmsg   db 13,10,'Sum = $'

; DOS buffered input buffers: first byte = max chars, second = actual chars
buf1     db 5, 0, 5 dup(0)    ; max 5 digits
buf2     db 5, 0, 5 dup(0)

; result buffer: up to 6 digits for 16-bit sums + '$' terminator
numbuf   db 6 dup(0), '$'

.code
start:
    mov ax,@data
    mov ds,ax

    ; Read first number
    lea dx,prompt1
    mov ah,9
    int 21h

    lea dx,buf1
    mov ah,0Ah
    int 21h

    lea dx,buf1
    call parseNumber    ; AX = first number
    push ax

    ; Read second number
    lea dx,prompt2
    mov ah,9
    int 21h

    lea dx,buf2
    mov ah,0Ah
    int 21h

    lea dx,buf2
    call parseNumber    ; AX = second number

    pop bx              ; BX = first number (saved)
    add ax,bx           ; AX = sum

    ; Convert sum in AX to ASCII string at numbuf
    lea di,numbuf
    call toDecimal      ; creates digits at numbuf[0..n-1] and trailing '$' at [n]

    ; Print result message
    lea dx,resmsg
    mov ah,9
    int 21h

    ; Print number
    lea dx,numbuf
    mov ah,9
    int 21h

    ; Exit
    mov ah,4Ch
    int 21h

; -------------------------
; parseNumber: parse decimal from buffer at DS:DX
; input: DS:DX -> buffer (DOS 0Ah layout)
; output: AX = parsed unsigned number
parseNumber proc
    push si
    push bx
    push cx

    mov si, dx          ; SI = buffer
    mov cl, [si+1]      ; CL = count of chars entered
    add si, 2           ; SI -> first digit char
    xor ax, ax          ; AX = 0 accumulator
    test cl, cl
    jz pn_done

pn_loop:
    mov bl, [si]        ; BL = ascii digit
    sub bl, '0'         ; BL = numeric digit 0..9
    mov bh, 0           ; BX = digit (word)

    ; AX = AX * 10  (AX*8 + AX*2) - avoid multi-bit immediate shift to prevent assembler error
    mov dx, ax
    shl ax, 1           ; AX = AX*2
    shl dx, 1
    shl dx, 1
    shl dx, 1           ; DX = AX_old*8
    add ax, dx          ; AX = AX_old*10

    add ax, bx          ; AX += digit
    inc si
    dec cl
    jnz pn_loop

pn_done:
    pop cx
    pop bx
    pop si
    ret
parseNumber endp

; -------------------------
; toDecimal: convert unsigned word in AX to decimal string
; input: AX = number, DI = address of numbuf (size at least 6; last byte used for '$')
; output: numbuf contains ascii digits starting at [0] and '$' terminator after digits
toDecimal proc
    push si
    push bx
    push cx
    push dx

    mov bx, di          ; BX = base pointer to numbuf
    mov si, bx
    add si, 5           ; SI = pointer to last digit slot (index 5)

    cmp ax, 0
    jne td_loop
    mov byte ptr [si], '0'
    dec si
    jmp td_after

td_loop:
    xor dx, dx
    mov cx, 10
    div cx              ; AX = AX/10, DX = remainder
    add dl, '0'
    mov [si], dl
    dec si
    cmp ax, 0
    jne td_loop

td_after:
    inc si              ; SI now points to first digit written
    ; compute count = 6 - (SI - BX)
    mov dx, si
    sub dx, bx          ; DX = startIndex
    mov cx, 6
    sub cx, dx          ; CX = number of digits

    ; copy digits from BX+startIndex (SI) to BX (start)
    mov di, bx          ; dest
    mov si, si          ; src already in SI
copy_loop:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    dec cx
    jnz copy_loop

    ; place '$' terminator
    mov byte ptr [di], '$'

    pop dx
    pop cx
    pop bx
    pop si
    ret
toDecimal endp

end start