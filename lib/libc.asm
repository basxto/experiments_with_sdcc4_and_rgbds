
SECTION "Libc", ROM0

MBC1_ROM_PAGE equ $2000

_printf::
    ret


banked_call::            ; Performs a long call.
    pop    hl        ; Get the return address
    ldh    a,[__current_bank]
    push    af        ; Push the current bank onto the stack
    ld    a,[hl+]        ; Fetch the call address
    ld    e, a
    ld    a,[hl+]
    ld    d, a
    ld    a,[hl+]        ; ...and page
    inc    hl        ; Yes this should be here
    push    hl        ; Push the real return address
    ldh    [__current_bank],a
    ld    [$2000],a    ; Perform the switch
    ld    l,e
    ld    h,d
    call ___sdcc_call_hl
    pop    hl        ; Get the return address
    pop    af        ; Pop the old bank
    ld    [$2000],a ; rROMB0
    ldh    [__current_bank],a
___sdcc_call_hl::
    jp    hl

___sdcc_bcall_ehl::
    ldh a, [__current_bank]
    push af
    ld a, e
    ldh [__current_bank], a
    ld [MBC1_ROM_PAGE], a
    call ___sdcc_call_hl
___sdcc_breturn_ehl::
    pop af
    ld [MBC1_ROM_PAGE], a
    ldh [__current_bank], a
    ret

SECTION "ROM bank", HRAM

__current_bank:
	db
