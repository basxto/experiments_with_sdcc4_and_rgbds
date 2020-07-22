
SECTION "Header", ROM0[$100]
	di
	jp init

SECTION "HRAM", HRAM[$FF90]
__current_bank::	; Current bank
	ds	1

MBC1_ROM_PAGE equ $2000

SECTION FRAGMENT "_GSINIT", ROM0
init::
	ret
___sdcc_call_hl::
	jp hl

___sdcc_bcall_ehl::
	ldh	a, [__current_bank]
	push af
	ld	a, e
	ldh	[__current_bank], a
	ld	[MBC1_ROM_PAGE], a
	call ___sdcc_call_hl
___sdcc_breturn_ehl::
	pop af
	ld	[MBC1_ROM_PAGE], a
	ldh	[__current_bank], a
	ret

