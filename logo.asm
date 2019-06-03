    org $C350

CHAN_OPEN equ $1601
CLEAR_1   equ $1EB7
PLOT_SUB  equ $22E5
DRAW_LINE equ $24BA
BORDCR    equ $5C48 ; https://skoolkid.github.io/rom/asm/5C48.html
UDG       equ $5C7B ; https://skoolkid.github.io/rom/asm/5C7B.html
ATTR_P    equ $5C8D ; https://skoolkid.github.io/rom/asm/5C8D.html
MASK_T    equ $5C90

    LD HL,sprites ;
    LD (UDG),HL   ;
    XOR A         ;
    LD (ATTR_P),A ;
    LD (BORDCR),A ;
    HALT          ;

    LD BC,$61A7   ; ???
    LD HL,$1303   ; ???
    PUSH HL       ;
    CALL CLEAR_1  ;
    LD HL,$1B76   ; ???
    PUSH HL       ;
    XOR A         ;
    OUT ($FE),A   ;
    LD A,$02      ;
    CALL CHAN_OPEN;
    LD HL,text    ;

print_char:
    LD A,(HL)       ;
    CP $FF          ;
    JP Z,draw_frame ;
    RST $10         ;
    INC HL          ;
    JR print_char   ;

draw_frame:
    LD HL,$FF58     ; ???
    LD (UDG),HL     ;
    LD A,$78        ;
    LD (MASK_T),A   ;
    LD A,$20        ;
    LD (MASK_T+1),A ;
    LD C,$36        ;
    LD B,$0E        ;
    CALL PLOT_SUB   ;
    LD C,$9B        ;
    LD B,$00        ;
    LD E,$01        ;
    LD D,$00        ;
    CALL DRAW_LINE  ;
    LD C,$00        ;
    LD B,$0B        ;
    LD E,$00        ;
    LD D,$01        ;
    CALL DRAW_LINE  ;
    LD C,$9B        ;
    LD B,$00        ;
    LD E,$FF        ;
    LD D,$00        ;
    CALL DRAW_LINE  ;
    LD C,$00        ;
    LD B,$0B        ;
    LD E,$00        ;
    LD D,$FF        ;
    CALL DRAW_LINE  ;
    LD HL,$2758     ;
    EXX             ;
    RET             ;

text:
    DEFB $16,$13,$07 ; AT 19,7
    DEFB $11,$02     ; PAPER 2
    DEFB $10,$07     ; INK 7
    DEFB $13,$01     ; BRIGHT 1
    DEFB $90,$91,$92,$93,$94,$95,$96,$97
    DEFB $98,$99,$9A,$9B,$9C,$9D,$9E,$9F
    DEFB $A0,$A1,$A2
    DEFB $FF

sprites:
    DEFB $00,$00,$00,$00,$00,$00,$00,$00
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
    DEFB $00,$00,$00,$00,$00,$00,$00,$00
