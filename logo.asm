    org $C350

CLS       equ $0D6B
CHAN_OPEN equ $1601
PR_STRING equ $203C
PLOT_SUB  equ $22E5
DRAW_LINE equ $24BA
BORDCR    equ $5C48 ; https://skoolkid.github.io/rom/asm/5C48.html
UDG       equ $5C7B ; https://skoolkid.github.io/rom/asm/5C7B.html
ATTR_P    equ $5C8D ; https://skoolkid.github.io/rom/asm/5C8D.html
MASK_T    equ $5C90
UDG_ORIG  equ $FF58

; Clear the screen
    XOR A         ;
    LD (ATTR_P),A ;
    LD (BORDCR),A ;
    OUT ($FE),A   ;
    CALL CLS      ;

; Point to the UDG
    LD HL,sprites ;
    LD (UDG),HL   ;

; Print the UDG
    LD A,$02           ;
    CALL CHAN_OPEN     ;
    LD DE,text         ;
    LD BC,sprites-text ;
    CALL PR_STRING     ;

; Restore the original UDG pointer
    LD HL,UDG_ORIG  ;
    LD (UDG),HL     ;

; Draw the frame
    LD BC,$2078     ;
    LD (MASK_T),BC  ;
    LD BC,$0E36     ;
    CALL PLOT_SUB   ;
    LD BC,$009B     ;
    LD DE,$0001     ;
    CALL DRAW_LINE  ;
    LD BC,$0B00     ;
    LD DE,$0100     ;
    CALL DRAW_LINE  ;
    LD BC,$009B     ;
    LD DE,$00FF     ;
    CALL DRAW_LINE  ;
    LD BC,$0B00     ;
    LD DE,$FF00     ;
    CALL DRAW_LINE  ;
    EXX             ;
    RET             ;

text:
    DEFB $16,$13,$07 ; AT 19,7
    DEFB $11,$02     ; PAPER 2
    DEFB $10,$07     ; INK 7
    DEFB $13,$01     ; BRIGHT 1
    DEFB $20,$90,$91,$92,$93,$94,$95,$96
    DEFB $97,$98,$99,$9A,$9B,$9C,$9D,$9E
    DEFB $9F,$A0,$20

sprites:
    DEFB $00,$1D,$21,$21,$21,$21,$1D,$00
    DEFB $00,$C6,$29,$29,$2F,$C9,$29,$00
    DEFB $00,$3A,$42,$43,$42,$42,$3A,$00
    DEFB $00,$5E,$90,$1C,$90,$50,$5E,$00
    DEFB $00,$E1,$91,$91,$91,$91,$E1,$00
    DEFB $00,$C8,$25,$C2,$22,$22,$C2,$00
    DEFB $00,$8E,$09,$0E,$09,$09,$0E,$00
    DEFB $00,$50,$50,$50,$50,$50,$5E,$00
    DEFB $00,$80,$81,$81,$81,$81,$F0,$00
    DEFB $00,$EA,$0A,$0A,$6A,$2A,$EB,$00
    DEFB $00,$1C,$12,$1C,$12,$12,$DC,$00
    DEFB $00,$F7,$84,$E4,$84,$87,$F4,$00
    DEFB $00,$3E,$88,$88,$88,$08,$88,$00
    DEFB $0E,$11,$24,$28,$28,$24,$11,$0E
    DEFB $00,$04,$8C,$84,$84,$84,$0E,$00
    DEFB $00,$63,$94,$93,$74,$14,$63,$00
    DEFB $00,$18,$A4,$18,$A4,$A4,$18,$00
