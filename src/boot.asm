INCLUDE src/header.inc

; Move the program to a known location
LD DE, $0B   ; the offset of the block to be moved
             ; relatively to the address after CALL minus 1
INC E        ; add 1 to reset the Z flag
CALL $1FC6   ; this is effectively LD HL, PC
ADD HL, DE   ; now HL points to the begginning of the loader
LD DE, ADDR  ; destination
LD BC, $00FD ; the size of the program to be moved
LDIR
JP ADDR
