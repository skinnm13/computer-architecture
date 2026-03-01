	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 5	sdk_version 15, 5
	.globl	_sum_for                        ; -- Begin function sum_for
	.p2align	2
_sum_for:                               ; @sum_for
	.cfi_startproc
; %bb.0:
	subs	w8, w1, w0
	b.ge	LBB0_2
; %bb.1:
	mov	w0, #0                          ; =0x0
	ret
LBB0_2:
	mvn	w9, w0
	add	w9, w9, w1
	umull	x9, w9, w8
	lsr	x9, x9, #1
	madd	w8, w8, w0, w8
	add	w8, w8, w0
	add	w0, w8, w9
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_sum_while                      ; -- Begin function sum_while
	.p2align	2
_sum_while:                             ; @sum_while
	.cfi_startproc
; %bb.0:
	subs	w8, w1, w0
	b.ge	LBB1_2
; %bb.1:
	mov	w0, #0                          ; =0x0
	ret
LBB1_2:
	mvn	w9, w0
	add	w9, w9, w1
	umull	x9, w9, w8
	lsr	x9, x9, #1
	madd	w8, w8, w0, w8
	add	w8, w8, w0
	add	w0, w8, w9
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_sum_do_while                   ; -- Begin function sum_do_while
	.p2align	2
_sum_do_while:                          ; @sum_do_while
	.cfi_startproc
; %bb.0:
	cmp	w1, w0
	csel	w8, w1, w0, gt
	mvn	w9, w0
	add	w9, w8, w9
	sub	w8, w8, w0
	umull	x9, w9, w8
	lsr	x9, x9, #1
	madd	w8, w8, w0, w8
	add	w8, w8, w0
	add	w0, w8, w9
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_sum_goto                       ; -- Begin function sum_goto
	.p2align	2
_sum_goto:                              ; @sum_goto
	.cfi_startproc
; %bb.0:
	subs	w8, w1, w0
	b.ge	LBB3_2
; %bb.1:
	mov	w0, #0                          ; =0x0
	ret
LBB3_2:
	mvn	w9, w0
	add	w9, w9, w1
	umull	x9, w9, w8
	lsr	x9, x9, #1
	madd	w8, w8, w0, w8
	add	w8, w8, w0
	add	w0, w8, w9
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	sub	x8, x29, #8
	sub	x9, x29, #4
	stp	x9, x8, [sp]
Lloh2:
	adrp	x0, l_.str.1@PAGE
Lloh3:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_scanf
	cmp	w0, #2
	b.ne	LBB4_3
; %bb.1:
	ldp	w9, w8, [x29, #-8]
	subs	w10, w9, w8
	b.ge	LBB4_4
; %bb.2:
	mov	w10, #0                         ; =0x0
	b	LBB4_5
LBB4_3:
Lloh4:
	adrp	x0, l_str@PAGE
Lloh5:
	add	x0, x0, l_str@PAGEOFF
	bl	_puts
	mov	w0, #1                          ; =0x1
	b	LBB4_9
LBB4_4:
	mvn	w11, w8
	add	w11, w9, w11
	umull	x11, w11, w10
	lsr	x11, x11, #1
	madd	w10, w10, w8, w10
	add	w10, w10, w8
	add	w10, w10, w11
LBB4_5:
	stp	x9, x10, [sp, #8]
	str	x8, [sp]
Lloh6:
	adrp	x0, l_.str.3@PAGE
Lloh7:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	ldp	w9, w8, [x29, #-8]
	mvn	w10, w8
	add	w10, w9, w10
	sub	w11, w9, w8
	umull	x10, w10, w11
	lsr	x10, x10, #1
	madd	w11, w11, w8, w11
	add	w11, w11, w8
	add	w10, w11, w10
	cmp	w9, w8
	csel	w10, wzr, w10, lt
	stp	x9, x10, [sp, #8]
	str	x8, [sp]
Lloh8:
	adrp	x0, l_.str.4@PAGE
Lloh9:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	ldp	w9, w8, [x29, #-8]
	cmp	w9, w8
	csel	w10, w9, w8, gt
	mvn	w11, w8
	add	w11, w10, w11
	sub	w10, w10, w8
	umull	x11, w11, w10
	lsr	x11, x11, #1
	madd	w10, w10, w8, w10
	add	w10, w10, w8
	add	w10, w10, w11
	stp	x8, x9, [sp]
	str	x10, [sp, #16]
Lloh10:
	adrp	x0, l_.str.5@PAGE
Lloh11:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	ldp	w9, w8, [x29, #-8]
	subs	w10, w9, w8
	b.ge	LBB4_7
; %bb.6:
	mov	w10, #0                         ; =0x0
	b	LBB4_8
LBB4_7:
	mvn	w11, w8
	add	w11, w9, w11
	umull	x11, w11, w10
	lsr	x11, x11, #1
	madd	w10, w10, w8, w10
	add	w10, w10, w8
	add	w10, w10, w11
LBB4_8:
	stp	x9, x10, [sp, #8]
	str	x8, [sp]
Lloh12:
	adrp	x0, l_.str.6@PAGE
Lloh13:
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_printf
	mov	w0, #0                          ; =0x0
LBB4_9:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh12, Lloh13
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Enter two integers a and b (a <= b): "

l_.str.1:                               ; @.str.1
	.asciz	"%d %d"

l_.str.3:                               ; @.str.3
	.asciz	"sum_for      (%d..%d) = %d\n"

l_.str.4:                               ; @.str.4
	.asciz	"sum_while    (%d..%d) = %d\n"

l_.str.5:                               ; @.str.5
	.asciz	"sum_do_while (%d..%d) = %d\n"

l_.str.6:                               ; @.str.6
	.asciz	"sum_goto     (%d..%d) = %d\n"

l_str:                                  ; @str
	.asciz	"Invalid input."

.subsections_via_symbols
