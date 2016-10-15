























































  
  
  

























	.text
	.align	32, 0x90
	.globl	__gmpn_nand_n
	
__gmpn_nand_n:

	push	%rdi
	push	%rsi
	mov	%rcx, %rdi
	mov	%rdx, %rsi
	mov	%r8, %rdx
	mov	%r9, %rcx

	movq	(%rdx), %r8
	movl	%ecx, %eax
	leaq	(%rdx,%rcx,8), %rdx
	leaq	(%rsi,%rcx,8), %rsi
	leaq	(%rdi,%rcx,8), %rdi
	negq	%rcx
	andl	$3, %eax
	je	Lb00
	cmpl	$2, %eax
	jc	Lb01
	je	Lb10

Lb11:	andq	(%rsi,%rcx,8), %r8
	notq	%r8
	movq	%r8, (%rdi,%rcx,8)
	decq	%rcx
	jmp	Le11
Lb10:	addq	$-2, %rcx
	jmp	Le10
	.byte	0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90
Lb01:	andq	(%rsi,%rcx,8), %r8
	notq	%r8
	movq	%r8, (%rdi,%rcx,8)
	incq	%rcx
	jz	Lret

Loop:	movq	(%rdx,%rcx,8), %r8
Lb00:	movq	8(%rdx,%rcx,8), %r9
	andq	(%rsi,%rcx,8), %r8
	notq	%r8
	andq	8(%rsi,%rcx,8), %r9
	notq	%r9
	movq	%r8, (%rdi,%rcx,8)
	movq	%r9, 8(%rdi,%rcx,8)
Le11:	movq	16(%rdx,%rcx,8), %r8
Le10:	movq	24(%rdx,%rcx,8), %r9
	andq	16(%rsi,%rcx,8), %r8
	notq	%r8
	andq	24(%rsi,%rcx,8), %r9
	notq	%r9
	movq	%r8, 16(%rdi,%rcx,8)
	movq	%r9, 24(%rdi,%rcx,8)
	addq	$4, %rcx
	jnc	Loop
Lret:	pop	%rsi
	pop	%rdi
	ret
	

