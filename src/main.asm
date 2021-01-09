.setcpu "65C02"
.include "x16.inc"
;.org  $0800

.segment "STARTUP"

.segment "INIT"

.segment "ONCE"

.segment "CODE"

jmp start

message: .byte "HELLO"
end_msg:

NEWLINE = $0D
UPPERCASE = $8E

start:
   ; force uppercase
   lda #UPPERCASE
   jsr CHROUT
   ; print message
   lda #<message
   sta ZP_PTR_1
   lda #>message
   sta ZP_PTR_1+1
   ldy #0
@loop:
   cpy #(end_msg-message)
   beq @done
   lda (ZP_PTR_1),y
   jsr CHROUT
   iny
   bra @loop
@done:
   ; print newline
   lda #NEWLINE
   jsr CHROUT
   rts
