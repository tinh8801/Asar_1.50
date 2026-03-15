lorom

org $000FFC0
pad     $00FFC0                 ; ROM Header
        db $48,$45,$4C,$4C,$4F,$20,$57,$4F,$52,$4C,$44,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
		;db      "HELLO WORLD          "
        db      $20,0,7,0,0,0,0,$aa,$aa,$55,$55
        dw      0,0,0,0,0,VBLANK,0,0    ; Reset Vectors
        dw      0,0,0,0,0,0,RESET,0

        org     $008000
		
 
RESET:  clc                             ; Native mode
        xce
        sep     #$24                    ; Disable interrupts, 8-bit memory
        rep     #$db                    ; Clear all other flags (16-bit index)
        ldx     #$03ff                  ; Stack is bottom 1K of scratch RAM
        txs
        phk                             ; Set data bank to prog bank
        plb
 
        stz     $4200                   ; Disable NMI
        stz     $420c                   ; Disable HDMA
        stz     $420d                   ; Declare SlowROM
        lda     #$ff                    ; Set I/O ports to all input
        sta     $4201
        lda     #$8f                    ; Disable display
        sta     $2100
        ldx     #$0033
-       stz     $2100,x                 ; Clear all PPU registers. Some need to
        stz     $2100,x                 ; to be written twice to fully clear.
        dex
        bne     -                       ; Quit before we zero $2100 itself
        lda     #$01                    ; Init regs that shouldn't be zero
        stz     $211b                   ; Set the Mode 7 coefficients sanely
        sta     $211b
        stz     $211e
        sta     $211e
        lda     #$30                    ; Disable color-math blending
        sta     $2130
        lda     #$e0                    ; Fixed color data is black
        sta     $2132
 
        lda     #$80                    ; Clear VRAM
        sta     $2115
        ldx     #$8000
        ldy     #$0000
        sty     $2116                   ; Start at VRAM word 0
-       sty     $2118                   ; Zero out all 32 kilowords of VRAM
        dex
        bne     -
 
        stz     $2121                   ; Load palette from color 0
        stz     $2122                   ; Color 0 = black
        stz     $2122
        lda     #$ff                    ; Color 1 = white
        sta     $2122
        sta     $2122
        ldx     #$0008                  ; Load characters
        stx     $2116
        ldx     #$0000
-       lda     chars,x                 ; 8 bits of data per char
        sta     $2118
        stz     $2119                   ; Top byte of each data word is zero
        inx
        cpx     #$0048
        bne     -
 
        ldx     #$41ca                  ; Write message
        stx     $2116
        ldx     #$0000
-       lda     msg,x
        sta     $2118
        stz     $2119
        inx
        cpx     #$000d
        bne     -
 
        lda     #$40                    ; BG1 Tilemap at $4000, 32x32
        sta     $2107
        lda     #$01                    ; Enable BG1
        sta     $212c                   ; (Reset code put us in Mode 0)
        lda     #$0f                    ; Enable display
        sta     $2100
.loop:  jmp     .loop                   ; Loop forever
 
VBLANK: rti
 
msg:    db      1,2,3,3,4,5,0,6,4,7,3,8,9
chars:  db      $00,$62,$62,$7e,$62,$62,$62,$00,$00,$7e,$60,$7c,$60,$60,$7e,$00
        db      $00,$60,$60,$60,$60,$60,$7e,$00,$00,$3c,$62,$62,$62,$62,$3c,$00
        db      $00,$00,$00,$00,$00,$00,$18,$30,$00,$62,$62,$62,$6a,$76,$62,$00
        db      $00,$7c,$66,$7c,$68,$64,$62,$00,$00,$7c,$62,$62,$62,$62,$7c,$00
        db      $00,$18,$18,$18,$18,$00,$18,$00
 
 
        org     $018000                 ; Blank remaining LoROM banks
        pad     $020000
        org     $028000
        pad     $030000
        org     $038000
        pad     $040000
