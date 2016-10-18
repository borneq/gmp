
































































	.text
	.align	32, 0x90
	.globl	__gmpn_popcount
	
__gmpn_popcount:

	push	%rdi
	push	%rsi
	mov	%rcx, %rdi
	mov	%rdx, %rsi


	lea	(%rdi,%rsi,8), %rdi
	xor	%eax, %eax

	test	$1, %sil
	jnz	Lbx1

Lbx0:	test	$2, %sil
	jnz	Lb10

Lb00:	mov	$0, %ecx
	sub	%rsi, %rcx
	.byte	0xf3,0x4c,0x0f,0xb8,0x04,0xcf		
	.byte	0xf3,0x4c,0x0f,0xb8,0x4c,0xcf,0x08	
	jmp	Llo0

Lb10:	mov	$2, %ecx
	sub	%rsi, %rcx
	.byte	0xf3,0x4c,0x0f,0xb8,0x54,0xcf,0xf0	
	.byte	0xf3,0x4c,0x0f,0xb8,0x5c,0xcf,0xf8	
	test	%rcx, %rcx
	jz	Lcj2
	jmp	Llo2

Lbx1:	test	$2, %sil
	jnz	Lb11

Lb01:	mov	$1, %ecx
	sub	%rsi, %rcx
	.byte	0xf3,0x4c,0x0f,0xb8,0x5c,0xcf,0xf8	
	test	%rcx, %rcx
	jz	Lcj1
	.byte	0xf3,0x4c,0x0f,0xb8,0x04,0xcf		
	jmp	Llo1

Lb11:	mov	$-1, %rcx
	sub	%rsi, %rcx
	.byte	0xf3,0x4c,0x0f,0xb8,0x4c,0xcf,0x08	
	.byte	0xf3,0x4c,0x0f,0xb8,0x54,0xcf,0x10	
	jmp	Llo3

	.align	32, 0x90
Ltop:	add	%r9, %rax
Llo2:	.byte	0xf3,0x4c,0x0f,0xb8,0x04,0xcf		
	add	%r10, %rax
Llo1:	.byte	0xf3,0x4c,0x0f,0xb8,0x4c,0xcf,0x08	
	add	%r11, %rax
Llo0:	.byte	0xf3,0x4c,0x0f,0xb8,0x54,0xcf,0x10	
	add	%r8, %rax
Llo3:	.byte	0xf3,0x4c,0x0f,0xb8,0x5c,0xcf,0x18	
	add	$4, %rcx
	js	Ltop

Lend:	add	%r9, %rax
Lcj2:	add	%r10, %rax
Lcj1:	add	%r11, %rax
	pop	%rsi
	pop	%rdi
	ret
	
