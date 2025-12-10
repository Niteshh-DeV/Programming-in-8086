.model small                ; set small memory model (one code, one data segment)
.stack 100h                 ; reserve 256 bytes for stack
.data                       ; start of data segment
prompt     db 'Enter a digit (0-9): $'   ; prompt string terminated by '$' for DOS AH=9
errMsg     db 13,10,'Input is not a digit.$' ; CR LF then error message terminated by '$'

.code                       ; start of code segment
main proc                   ; main procedure entry point
    mov ax,@data            ; load address of data segment into AX
    mov ds,ax              ; set DS to point to data segment

    ; prompt                ; printing prompt
    mov dx, offset prompt  ; load offset of prompt string into DX
    mov ah, 9              ; DOS function 9: display string at DS:DX
    int 21h                ; call DOS interrupt to print prompt

    ; read a single char (echoed)
    mov ah, 1              ; DOS function 1: read character from STDIN with echo
    int 21h                ; AL = ASCII char read

    ; convert ASCII to numeric (0-9)
    sub al, '0'            ; convert ASCII digit to numeric value (0-9)
    cmp al, 0              ; compare value with 0 to check lower bound
    jb not_digit           ; if below 0 (unsigned), it's not a digit -> jump to error
    cmp al, 9              ; compare value with 9 to check upper bound
    ja not_digit           ; if above 9, it's not a digit -> jump to error

    ; increment number, wrap 9 -> 0
    inc al                 ; increment numeric value
    cmp al, 10             ; if value became 10, we wrapped past 9
    jne show               ; if not 10, skip wrap handling
    mov al, 0              ; wrap 10 back to 0

show:                      ; label to show result character
    add al, '0'            ; convert numeric value back to ASCII
    mov dl, al             ; move result char into DL for DOS print
    mov ah, 2              ; DOS function 2: display character in DL
    int 21h                ; print result character
    jmp done               ; jump to program termination

not_digit:                 ; label for non-digit input handling
    mov dx, offset errMsg  ; load offset of error message into DX
    mov ah, 9              ; DOS function 9: display string at DS:DX
    int 21h                ; print error message

done:                      ; program termination label
    mov ah, 4Ch            ; DOS function 4Ch: terminate process, return code in AL
    int 21h                ; exit to DOS
main endp                  ; end of main procedure
end main                   ; end of source, entry point = main