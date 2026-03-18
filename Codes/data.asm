.DATA
NUM1 DB 25H
NUM2 DB ?

.CODE
MOV AX, @DATA
MOV DS, AX

MOV AL, NUM1     ; Transfer data from memory to register
MOV BL, AL       ; Transfer data from register AL to register BL
MOV NUM2, BL     ; Transfer data from register to memory

MOV CL, 10H
MOV DL, 20H
XCHG CL, DL      ; Exchange values between registers