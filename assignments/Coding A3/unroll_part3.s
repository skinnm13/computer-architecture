	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 5	sdk_version 15, 5
	.globl	_sum_array_base                 ; -- Begin function sum_array_base
	.p2align	2
_sum_array_base:                        ; @sum_array_base
	.cfi_startproc
; %bb.0:
	mov	x9, #0                          ; =0x0
	mov	w8, #0                          ; =0x0
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w10, [x0, x9]
	add	w8, w10, w8
	add	x9, x9, #4
	cmp	x9, #200
	b.ne	LBB0_1
; %bb.2:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_sum_array_u2                   ; -- Begin function sum_array_u2
	.p2align	2
_sum_array_u2:                          ; @sum_array_u2
	.cfi_startproc
; %bb.0:
	mov	x8, x0
	mov	w0, #0                          ; =0x0
	add	x8, x8, #4
	mov	x9, #-2                         ; =0xfffffffffffffffe
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldp	w10, w11, [x8, #-4]
	add	w10, w10, w0
	add	w0, w10, w11
	add	x9, x9, #2
	add	x8, x8, #8
	cmp	x9, #48
	b.lo	LBB1_1
; %bb.2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_sum_array_u5                   ; -- Begin function sum_array_u5
	.p2align	2
_sum_array_u5:                          ; @sum_array_u5
	.cfi_startproc
; %bb.0:
	mov	x8, x0
	mov	w0, #0                          ; =0x0
	add	x8, x8, #8
	mov	x9, #-5                         ; =0xfffffffffffffffb
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	ldp	w10, w11, [x8, #-8]
	add	w10, w10, w0
	ldp	w12, w13, [x8]
	add	w11, w11, w12
	add	w10, w10, w11
	ldr	w11, [x8, #8]
	add	w11, w13, w11
	add	w0, w10, w11
	add	x9, x9, #5
	add	x8, x8, #20
	cmp	x9, #45
	b.lo	LBB2_1
; %bb.2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_sum_array_u10                  ; -- Begin function sum_array_u10
	.p2align	2
_sum_array_u10:                         ; @sum_array_u10
	.cfi_startproc
; %bb.0:
	mov	x8, x0
	mov	w0, #0                          ; =0x0
	add	x8, x8, #20
	mov	x9, #-10                        ; =0xfffffffffffffff6
LBB3_1:                                 ; =>This Inner Loop Header: Depth=1
	ldp	w10, w11, [x8, #-20]
	add	w10, w10, w0
	ldp	w12, w13, [x8, #-12]
	add	w11, w11, w12
	add	w10, w10, w11
	ldp	w11, w12, [x8, #-4]
	add	w11, w13, w11
	add	w11, w11, w12
	add	w10, w10, w11
	ldp	w14, w11, [x8, #4]
	ldp	w13, w12, [x8, #12]
	add	w11, w14, w11
	add	w11, w11, w13
	add	w11, w11, w12
	add	w0, w10, w11
	add	x9, x9, #10
	add	x8, x8, #40
	cmp	x9, #40
	b.lo	LBB3_1
; %bb.2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_time_function_ns_per_call      ; -- Begin function time_function_ns_per_call
	.p2align	2
_time_function_ns_per_call:             ; @time_function_ns_per_call
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x19, x1
	mov	x20, x0
	mov	w22, #1000                      ; =0x3e8
	adrp	x21, _sink@PAGE
LBB4_1:                                 ; =>This Inner Loop Header: Depth=1
	mov	x0, x19
	blr	x20
	ldr	w8, [x21, _sink@PAGEOFF]
	eor	w8, w8, w0
	str	w8, [x21, _sink@PAGEOFF]
	subs	w22, w22, #1
	b.ne	LBB4_1
; %bb.2:
	mov	x1, sp
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	x23, x22, [sp]
	mov	w24, #33920                     ; =0x8480
	movk	w24, #30, lsl #16
LBB4_3:                                 ; =>This Inner Loop Header: Depth=1
	mov	x0, x19
	blr	x20
	ldr	w8, [x21, _sink@PAGEOFF]
	eor	w8, w8, w0
	str	w8, [x21, _sink@PAGEOFF]
	subs	w24, w24, #1
	b.ne	LBB4_3
; %bb.4:
	mov	x1, sp
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	x8, x9, [sp]
	sub	x8, x8, x23
	mov	w10, #51712                     ; =0xca00
	movk	w10, #15258, lsl #16
	sub	x9, x9, x22
	madd	x8, x8, x10, x9
	ucvtf	d0, x8
	mov	x8, #145685290680320            ; =0x848000000000
	movk	x8, #16702, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #352
	stp	d11, d10, [sp, #256]            ; 16-byte Folded Spill
	stp	d9, d8, [sp, #272]              ; 16-byte Folded Spill
	stp	x24, x23, [sp, #288]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #304]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #320]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #336]            ; 16-byte Folded Spill
	add	x29, sp, #336
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset b8, -72
	.cfi_offset b9, -80
	.cfi_offset b10, -88
	.cfi_offset b11, -96
	mov	x8, #0                          ; =0x0
	mov	w9, #0                          ; =0x0
Lloh0:
	adrp	x10, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x10, [x10, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x10, [x10]
	stur	x10, [x29, #-88]
	mov	w10, #1                         ; =0x1
	mov	w11, #18725                     ; =0x4925
	movk	w11, #9362, lsl #16
	add	x12, sp, #48
LBB5_1:                                 ; =>This Inner Loop Header: Depth=1
	umull	x13, w9, w11
	lsr	x13, x13, #32
	sub	w14, w9, w13
	add	w13, w13, w14, lsr #1
	lsr	w13, w13, #2
	sub	w13, w13, w13, lsl #3
	add	w13, w10, w13
	str	w13, [x12, x8]
	add	w10, w10, #1
	add	w9, w9, #1
	add	x8, x8, #4
	cmp	x8, #200
	b.ne	LBB5_1
; %bb.2:
	mov	x9, #0                          ; =0x0
	mov	w8, #0                          ; =0x0
	add	x10, sp, #48
LBB5_3:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w11, [x10, x9]
	add	w8, w11, w8
	add	x9, x9, #4
	cmp	x9, #200
	b.ne	LBB5_3
; %bb.4:
	mov	w9, #0                          ; =0x0
	add	x10, sp, #48
	add	x10, x10, #4
	mov	x11, #-2                        ; =0xfffffffffffffffe
LBB5_5:                                 ; =>This Inner Loop Header: Depth=1
	ldp	w12, w13, [x10, #-4]
	add	w9, w12, w9
	add	w9, w9, w13
	add	x11, x11, #2
	add	x10, x10, #8
	cmp	x11, #48
	b.lo	LBB5_5
; %bb.6:
	mov	w10, #0                         ; =0x0
	add	x11, sp, #48
	add	x11, x11, #8
	mov	x12, #-5                        ; =0xfffffffffffffffb
LBB5_7:                                 ; =>This Inner Loop Header: Depth=1
	ldp	w13, w14, [x11, #-8]
	add	w10, w13, w10
	ldp	w13, w15, [x11]
	add	w13, w14, w13
	add	w10, w10, w13
	ldr	w13, [x11, #8]
	add	w13, w15, w13
	add	w10, w10, w13
	add	x12, x12, #5
	add	x11, x11, #20
	cmp	x12, #45
	b.lo	LBB5_7
; %bb.8:
	mov	w13, #0                         ; =0x0
	add	x11, sp, #48
	add	x11, x11, #20
	mov	x12, #-10                       ; =0xfffffffffffffff6
LBB5_9:                                 ; =>This Inner Loop Header: Depth=1
	ldp	w14, w15, [x11, #-20]
	add	w13, w14, w13
	ldp	w14, w16, [x11, #-12]
	add	w14, w15, w14
	add	w13, w13, w14
	ldp	w14, w15, [x11, #-4]
	add	w14, w16, w14
	add	w14, w14, w15
	add	w13, w13, w14
	ldp	w17, w14, [x11, #4]
	ldr	w15, [x11, #12]
	add	w14, w17, w14
	add	w14, w14, w15
	ldr	w15, [x11, #16]
	add	w14, w14, w15
	add	w13, w13, w14
	add	x12, x12, #10
	add	x11, x11, #40
	cmp	x12, #40
	b.lo	LBB5_9
; %bb.10:
	cmp	w8, w9
	b.ne	LBB5_46
; %bb.11:
	cmp	w8, w10
	b.ne	LBB5_46
; %bb.12:
	cmp	w8, w13
	b.ne	LBB5_46
; %bb.13:
	mov	w8, #0                          ; =0x0
	add	x9, sp, #48
	adrp	x19, _sink@PAGE
LBB5_14:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_15 Depth 2
	mov	x11, #0                         ; =0x0
	mov	w10, #0                         ; =0x0
LBB5_15:                                ;   Parent Loop BB5_14 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w12, [x9, x11]
	add	w10, w12, w10
	add	x11, x11, #4
	cmp	x11, #200
	b.ne	LBB5_15
; %bb.16:                               ;   in Loop: Header=BB5_14 Depth=1
	ldr	w11, [x19, _sink@PAGEOFF]
	eor	w10, w11, w10
	str	w10, [x19, _sink@PAGEOFF]
	add	w8, w8, #1
	cmp	w8, #1000
	b.ne	LBB5_14
; %bb.17:
	mov	w20, #33920                     ; =0x8480
	movk	w20, #30, lsl #16
	add	x1, sp, #32
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	mov	w8, #0                          ; =0x0
	ldp	x22, x23, [sp, #32]
	add	x9, sp, #48
LBB5_18:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_19 Depth 2
	mov	x11, #0                         ; =0x0
	mov	w10, #0                         ; =0x0
LBB5_19:                                ;   Parent Loop BB5_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w12, [x9, x11]
	add	w10, w12, w10
	add	x11, x11, #4
	cmp	x11, #200
	b.ne	LBB5_19
; %bb.20:                               ;   in Loop: Header=BB5_18 Depth=1
	ldr	w11, [x19, _sink@PAGEOFF]
	eor	w10, w11, w10
	str	w10, [x19, _sink@PAGEOFF]
	add	w8, w8, #1
	cmp	w8, w20
	b.ne	LBB5_18
; %bb.21:
	mov	w21, #51712                     ; =0xca00
	movk	w21, #15258, lsl #16
	add	x1, sp, #32
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	mov	w8, #0                          ; =0x0
	ldp	x9, x10, [sp, #32]
	sub	x9, x9, x22
	sub	x10, x10, x23
	madd	x9, x9, x21, x10
	ucvtf	d8, x9
	add	x9, sp, #48
	add	x9, x9, #4
LBB5_22:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_23 Depth 2
	mov	w10, #0                         ; =0x0
	mov	x11, #-2                        ; =0xfffffffffffffffe
	mov	x12, x9
LBB5_23:                                ;   Parent Loop BB5_22 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	w13, w14, [x12, #-4]
	add	w10, w13, w10
	add	w10, w10, w14
	add	x11, x11, #2
	add	x12, x12, #8
	cmp	x11, #48
	b.lo	LBB5_23
; %bb.24:                               ;   in Loop: Header=BB5_22 Depth=1
	ldr	w11, [x19, _sink@PAGEOFF]
	eor	w10, w11, w10
	str	w10, [x19, _sink@PAGEOFF]
	add	w8, w8, #1
	cmp	w8, #1000
	b.ne	LBB5_22
; %bb.25:
	add	x1, sp, #32
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	mov	w8, #0                          ; =0x0
	ldp	x22, x23, [sp, #32]
	add	x9, sp, #48
	add	x9, x9, #4
LBB5_26:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_27 Depth 2
	mov	w10, #0                         ; =0x0
	mov	x11, #-2                        ; =0xfffffffffffffffe
	mov	x12, x9
LBB5_27:                                ;   Parent Loop BB5_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	w13, w14, [x12, #-4]
	add	w10, w13, w10
	add	w10, w10, w14
	add	x11, x11, #2
	add	x12, x12, #8
	cmp	x11, #48
	b.lo	LBB5_27
; %bb.28:                               ;   in Loop: Header=BB5_26 Depth=1
	ldr	w11, [x19, _sink@PAGEOFF]
	eor	w10, w11, w10
	str	w10, [x19, _sink@PAGEOFF]
	add	w8, w8, #1
	cmp	w8, w20
	b.ne	LBB5_26
; %bb.29:
	add	x1, sp, #32
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	mov	w8, #0                          ; =0x0
	ldp	x9, x10, [sp, #32]
	sub	x9, x9, x22
	sub	x10, x10, x23
	madd	x9, x9, x21, x10
	ucvtf	d9, x9
	add	x9, sp, #48
	add	x9, x9, #8
LBB5_30:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_31 Depth 2
	mov	w12, #0                         ; =0x0
	mov	x10, #-5                        ; =0xfffffffffffffffb
	mov	x11, x9
LBB5_31:                                ;   Parent Loop BB5_30 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	w13, w14, [x11, #-8]
	add	w12, w13, w12
	ldp	w13, w15, [x11]
	add	w13, w14, w13
	add	w12, w12, w13
	ldr	w13, [x11, #8]
	add	w13, w15, w13
	add	w12, w12, w13
	add	x10, x10, #5
	add	x11, x11, #20
	cmp	x10, #45
	b.lo	LBB5_31
; %bb.32:                               ;   in Loop: Header=BB5_30 Depth=1
	ldr	w10, [x19, _sink@PAGEOFF]
	eor	w10, w10, w12
	str	w10, [x19, _sink@PAGEOFF]
	add	w8, w8, #1
	cmp	w8, #1000
	b.ne	LBB5_30
; %bb.33:
	mov	x8, #145685290680320            ; =0x848000000000
	movk	x8, #16702, lsl #48
	fmov	d0, x8
	fdiv	d8, d8, d0
	add	x1, sp, #32
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	mov	w8, #0                          ; =0x0
	ldp	x22, x23, [sp, #32]
	add	x9, sp, #48
	add	x9, x9, #8
LBB5_34:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_35 Depth 2
	mov	w12, #0                         ; =0x0
	mov	x10, #-5                        ; =0xfffffffffffffffb
	mov	x11, x9
LBB5_35:                                ;   Parent Loop BB5_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	w13, w14, [x11, #-8]
	add	w12, w13, w12
	ldp	w13, w15, [x11]
	add	w13, w14, w13
	add	w12, w12, w13
	ldr	w13, [x11, #8]
	add	w13, w15, w13
	add	w12, w12, w13
	add	x10, x10, #5
	add	x11, x11, #20
	cmp	x10, #45
	b.lo	LBB5_35
; %bb.36:                               ;   in Loop: Header=BB5_34 Depth=1
	ldr	w10, [x19, _sink@PAGEOFF]
	eor	w10, w10, w12
	str	w10, [x19, _sink@PAGEOFF]
	add	w8, w8, #1
	cmp	w8, w20
	b.ne	LBB5_34
; %bb.37:
	add	x1, sp, #32
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	mov	w8, #0                          ; =0x0
	ldp	x9, x10, [sp, #32]
	sub	x9, x9, x22
	sub	x10, x10, x23
	madd	x9, x9, x21, x10
	ucvtf	d10, x9
	add	x9, sp, #48
	add	x9, x9, #20
LBB5_38:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_39 Depth 2
	mov	w12, #0                         ; =0x0
	mov	x10, #-10                       ; =0xfffffffffffffff6
	mov	x11, x9
LBB5_39:                                ;   Parent Loop BB5_38 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	w13, w14, [x11, #-20]
	add	w12, w13, w12
	ldp	w13, w15, [x11, #-12]
	add	w13, w14, w13
	add	w12, w12, w13
	ldp	w13, w14, [x11, #-4]
	add	w13, w15, w13
	add	w13, w13, w14
	add	w12, w12, w13
	ldp	w16, w13, [x11, #4]
	ldp	w15, w14, [x11, #12]
	add	w13, w16, w13
	add	w13, w13, w15
	add	w13, w13, w14
	add	w12, w12, w13
	add	x10, x10, #10
	add	x11, x11, #40
	cmp	x10, #40
	b.lo	LBB5_39
; %bb.40:                               ;   in Loop: Header=BB5_38 Depth=1
	ldr	w10, [x19, _sink@PAGEOFF]
	eor	w10, w10, w12
	str	w10, [x19, _sink@PAGEOFF]
	add	w8, w8, #1
	cmp	w8, #1000
	b.ne	LBB5_38
; %bb.41:
	mov	x8, #145685290680320            ; =0x848000000000
	movk	x8, #16702, lsl #48
	fmov	d0, x8
	fdiv	d9, d9, d0
	add	x1, sp, #32
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	mov	w8, #0                          ; =0x0
	ldp	x22, x23, [sp, #32]
	add	x9, sp, #48
	add	x9, x9, #20
LBB5_42:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_43 Depth 2
	mov	w12, #0                         ; =0x0
	mov	x10, #-10                       ; =0xfffffffffffffff6
	mov	x11, x9
LBB5_43:                                ;   Parent Loop BB5_42 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	w13, w14, [x11, #-20]
	add	w12, w13, w12
	ldp	w13, w15, [x11, #-12]
	add	w13, w14, w13
	add	w12, w12, w13
	ldp	w13, w14, [x11, #-4]
	add	w13, w15, w13
	add	w13, w13, w14
	add	w12, w12, w13
	ldp	w16, w13, [x11, #4]
	ldp	w15, w14, [x11, #12]
	add	w13, w16, w13
	add	w13, w13, w15
	add	w13, w13, w14
	add	w12, w12, w13
	add	x10, x10, #10
	add	x11, x11, #40
	cmp	x10, #40
	b.lo	LBB5_43
; %bb.44:                               ;   in Loop: Header=BB5_42 Depth=1
	ldr	w10, [x19, _sink@PAGEOFF]
	eor	w10, w10, w12
	str	w10, [x19, _sink@PAGEOFF]
	add	w8, w8, #1
	cmp	w8, w20
	b.ne	LBB5_42
; %bb.45:
	mov	x8, #145685290680320            ; =0x848000000000
	movk	x8, #16702, lsl #48
	fmov	d11, x8
	fdiv	d10, d10, d11
	add	x1, sp, #32
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	x8, x9, [sp, #32]
	sub	x8, x8, x22
	sub	x9, x9, x23
	madd	x8, x8, x21, x9
	ucvtf	d0, x8
	fdiv	d11, d0, d11
Lloh3:
	adrp	x0, l_str@PAGE
Lloh4:
	add	x0, x0, l_str@PAGEOFF
	bl	_puts
	mov	x8, #4607182418800017408        ; =0x3ff0000000000000
	str	x8, [sp, #8]
	str	d8, [sp]
Lloh5:
	adrp	x0, l_.str.2@PAGE
Lloh6:
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	fdiv	d0, d8, d9
	stp	d9, d0, [sp]
Lloh7:
	adrp	x0, l_.str.3@PAGE
Lloh8:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	fdiv	d0, d8, d10
	stp	d10, d0, [sp]
Lloh9:
	adrp	x0, l_.str.4@PAGE
Lloh10:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	fdiv	d0, d8, d11
	stp	d11, d0, [sp]
Lloh11:
	adrp	x0, l_.str.5@PAGE
Lloh12:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	mov	w0, #0                          ; =0x0
	b	LBB5_47
LBB5_46:
	stp	x10, x13, [sp, #16]
	stp	x8, x9, [sp]
Lloh13:
	adrp	x0, l_.str@PAGE
Lloh14:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	w0, #1                          ; =0x1
LBB5_47:
	ldur	x8, [x29, #-88]
Lloh15:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh16:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh17:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB5_49
; %bb.48:
	ldp	x29, x30, [sp, #336]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #320]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #304]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #288]            ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #272]              ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #256]            ; 16-byte Folded Reload
	add	sp, sp, #352
	ret
LBB5_49:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpAdd	Lloh11, Lloh12
	.loh AdrpAdd	Lloh9, Lloh10
	.loh AdrpAdd	Lloh7, Lloh8
	.loh AdrpAdd	Lloh5, Lloh6
	.loh AdrpAdd	Lloh3, Lloh4
	.loh AdrpAdd	Lloh13, Lloh14
	.loh AdrpLdrGotLdr	Lloh15, Lloh16, Lloh17
	.cfi_endproc
                                        ; -- End function
	.globl	_sink                           ; @sink
.zerofill __DATA,__common,_sink,4,2
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"ERROR: sums do not match! base=%d u2=%d u5=%d u10=%d\n"

l_.str.2:                               ; @.str.2
	.asciz	"base,%.3f,%.3f\n"

l_.str.3:                               ; @.str.3
	.asciz	"unroll2,%.3f,%.3f\n"

l_.str.4:                               ; @.str.4
	.asciz	"unroll5,%.3f,%.3f\n"

l_.str.5:                               ; @.str.5
	.asciz	"unroll10,%.3f,%.3f\n"

l_str:                                  ; @str
	.asciz	"version,ns_per_call,speedup_vs_base"

.subsections_via_symbols
