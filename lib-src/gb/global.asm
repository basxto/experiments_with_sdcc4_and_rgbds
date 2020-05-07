	; Automagically from "global.s" by 
NEAR_CALLS	EQU	1
	
	;  Changed by astorgb.pl to 1
__RGBDS__	EQU	1
	
	
	;   Screen dimensions 
MAXCURSPOSX	EQU	$13
MAXCURSPOSY	EQU	$11
	
START	EQU	$80
SELECT	EQU	$40
PAD_B	EQU	$20
PAD_A	EQU	$10
DOWN	EQU	$08
UP	EQU	$04
LEFT	EQU	$02
RIGHT	EQU	$01
	
SCREENWIDTH	EQU	$A0
SCREENHEIGHT	EQU	$90
MINWNDPOSX	EQU	$07
MINWNDPOSY	EQU	$00
MAXWNDPOSX	EQU	$A6
MAXWNDPOSY	EQU	$8F
	
VBL_IFLAG	EQU	$01
LCD_IFLAG	EQU	$02
TIM_IFLAG	EQU	$04
SIO_IFLAG	EQU	$08
JOY_IFLAG	EQU	$10
	
P1	EQU	$00
SB	EQU	$01
SC	EQU	$02
R_DIV	EQU	$04
TIMA	EQU	$05
TMA	EQU	$06
TAC	EQU	$07
R_IF	EQU	$0F
NR10	EQU	$10
NR11	EQU	$11
NR12	EQU	$12
NR13	EQU	$13
NR14	EQU	$14
NR21	EQU	$16
NR22	EQU	$17
NR23	EQU	$18
NR24	EQU	$19
NR30	EQU	$1A
NR31	EQU	$1B
NR32	EQU	$1C
NR33	EQU	$1D
NR34	EQU	$1E
NR41	EQU	$20
NR42	EQU	$21
NR43	EQU	$22
NR44	EQU	$23
NR50	EQU	$24
NR51	EQU	$25
NR52	EQU	$26
LCDC	EQU	$40
STAT	EQU	$41
SCY	EQU	$42
SCX	EQU	$43
LY	EQU	$44
LYC	EQU	$45
DMA	EQU	$46
BGP	EQU	$47
OBP0	EQU	$48
OBP1	EQU	$49
WY	EQU	$4A
WX	EQU	$4B
KEY1	EQU	$4D
VBK	EQU	$4F
HDMA1	EQU	$51
HDMA2	EQU	$52
HDMA3	EQU	$53
HDMA4	EQU	$54
HDMA5	EQU	$55
RP	EQU	$56
BCPS	EQU	$68
BCPD	EQU	$69
OCPS	EQU	$6A
OCPD	EQU	$6B
SVBK	EQU	$70
IE	EQU	$FF
	
G_MODE	EQU	$01
T_MODE	EQU	$02
T_MODE_OUT	EQU	$02
T_MODE_INOUT	EQU	$03
M_NO_SCROLL	EQU	$04
M_NO_INTERP	EQU	$08
	
MBC1_ROM_PAGE	EQU	$2000

OAM_ADDRESS	EQU	$FE00
STACK_ADDRESS	EQU	$E000
	
	;  Status codes for IO
IO_IDLE	EQU	$00
IO_SENDING	EQU	$01
IO_RECEIVING	EQU	$02
IO_ERROR	EQU	$04
	
	;  Type of IO data
DT_IDLE	EQU	$66
DT_RECEIVING	EQU	$55
	
	;  Table of routines for modes
MODE_TABLE	EQU	$01E0
	
	;  C related
	;  Overheap of a banked call.  Used for parameters
	;   = ret + real ret + bank
	
IF	NEAR_CALLS	
BANKOV	EQU	2
	
ELSE		
BANKOV	EQU	6
	
ENDC		
	
	GLOBAL	___sdcc_call_hl	
	
	GLOBAL	banked_call	
	GLOBAL	banked_ret	
	
	;  Global variables
	GLOBAL	mode	
	
	GLOBAL	__cpu	
	
	GLOBAL	__io_out	
	GLOBAL	__io_in	
	GLOBAL	__io_status	
	
	;  Global routines
	GLOBAL	set_mode	
	
	GLOBAL	reset	
	
	GLOBAL	display_off	
	
	GLOBAL	wait_vbl_done	
	
	;  Interrupt routines 
	GLOBAL	add_VBL	
	GLOBAL	add_LCD	
	GLOBAL	add_TIM	
	GLOBAL	add_SIO	
	GLOBAL	add_JOY	
	
	;  Symbols defined at link time
	GLOBAL	refresh_OAM	
	
	;  Initialization routine   
	GLOBAL	init	
	
	;  Main user routine	
	GLOBAL	_main	