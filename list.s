	.file	"list.c"
	.text
	.section	.rodata
.LC0:
	.string	"dddd"
.LC2:
	.string	"r"
.LC3:
	.string	"rd"
.LC4:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$333, %r8d
	movl	$555, %ecx
	movl	$555, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	new_list
	movq	%rax, -16(%rbp)
	movq	.LC1(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %xmm0
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	push_list
	movq	%rax, -8(%rbp)
	movq	.LC1(%rip), %rcx
	movq	-16(%rbp), %rax
	movl	$1, %edx
	movq	%rcx, %xmm0
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	elemin_list
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	print_list
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free_list
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
.LC5:
	.string	"d"
.LC6:
	.string	"s"
	.text
	.globl	new_list
	.type	new_list, @function
new_list:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	movq	%rdi, -248(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L4
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L4:
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -216(%rbp)
	movq	-216(%rbp), %rax
	movq	%rax, -224(%rbp)
	movq	-216(%rbp), %rax
	movl	$0, (%rax)
	movq	-216(%rbp), %rax
	movq	$0, 16(%rax)
	movl	$8, -208(%rbp)
	movl	$48, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	jmp	.L5
.L16:
	movq	-248(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	cmpl	$115, %eax
	je	.L6
	cmpl	$115, %eax
	jg	.L7
	cmpl	$100, %eax
	je	.L8
	cmpl	$114, %eax
	je	.L9
	jmp	.L7
.L8:
	movl	-208(%rbp), %eax
	cmpl	$47, %eax
	ja	.L10
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L11
.L10:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L11:
	movq	(%rax), %rax
	movq	%rax, -232(%rbp)
	movq	-232(%rbp), %rdx
	movq	-224(%rbp), %rax
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	push_list
	movq	%rax, -224(%rbp)
	jmp	.L7
.L9:
	movl	-204(%rbp), %eax
	cmpl	$175, %eax
	ja	.L12
	movq	-192(%rbp), %rax
	movl	-204(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-204(%rbp), %edx
	addl	$16, %edx
	movl	%edx, -204(%rbp)
	jmp	.L13
.L12:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L13:
	movsd	(%rax), %xmm0
	movsd	%xmm0, -232(%rbp)
	movq	-232(%rbp), %rdx
	movq	-224(%rbp), %rax
	movq	%rdx, %xmm0
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	push_list
	movq	%rax, -224(%rbp)
	jmp	.L7
.L6:
	movl	-208(%rbp), %eax
	cmpl	$47, %eax
	ja	.L14
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L15
.L14:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L15:
	movq	(%rax), %rax
	movq	%rax, -232(%rbp)
	movq	-232(%rbp), %rdx
	movq	-224(%rbp), %rax
	leaq	.LC6(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	push_list
	movq	%rax, -224(%rbp)
	nop
.L7:
	addq	$1, -248(%rbp)
.L5:
	movq	-248(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L16
	movq	-216(%rbp), %rax
	movq	-184(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	new_list, .-new_list
	.section	.rodata
.LC7:
	.string	"list is null"
.LC8:
	.string	"%s\n"
	.text
	.globl	push_list
	.type	push_list, @function
push_list:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$240, %rsp
	movq	%rdi, -232(%rbp)
	movq	%rsi, -240(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L20
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L20:
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	cmpq	$0, -232(%rbp)
	jne	.L23
	movq	stderr(%rip), %rax
	leaq	.LC7(%rip), %rdx
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L37
.L24:
	movq	-232(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -232(%rbp)
.L23:
	movq	-232(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L24
	movl	$16, -208(%rbp)
	movl	$48, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	jmp	.L25
.L36:
	movq	-240(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	cmpl	$115, %eax
	je	.L26
	cmpl	$115, %eax
	jg	.L27
	cmpl	$100, %eax
	je	.L28
	cmpl	$114, %eax
	je	.L29
	jmp	.L27
.L28:
	movl	-208(%rbp), %eax
	cmpl	$47, %eax
	ja	.L30
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L31
.L30:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L31:
	movq	(%rax), %rax
	movq	%rax, -216(%rbp)
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-232(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -232(%rbp)
	movq	-232(%rbp), %rax
	movl	$1, (%rax)
	movq	-216(%rbp), %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-232(%rbp), %rax
	movq	$0, 16(%rax)
	jmp	.L27
.L29:
	movl	-204(%rbp), %eax
	cmpl	$175, %eax
	ja	.L32
	movq	-192(%rbp), %rax
	movl	-204(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-204(%rbp), %edx
	addl	$16, %edx
	movl	%edx, -204(%rbp)
	jmp	.L33
.L32:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L33:
	movsd	(%rax), %xmm0
	movsd	%xmm0, -216(%rbp)
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-232(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -232(%rbp)
	movq	-232(%rbp), %rax
	movl	$2, (%rax)
	movsd	-216(%rbp), %xmm0
	movq	-232(%rbp), %rax
	movsd	%xmm0, 8(%rax)
	movq	-232(%rbp), %rax
	movq	$0, 16(%rax)
	jmp	.L27
.L26:
	movl	-208(%rbp), %eax
	cmpl	$47, %eax
	ja	.L34
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L35
.L34:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L35:
	movq	(%rax), %rax
	movq	%rax, -216(%rbp)
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-232(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -232(%rbp)
	movq	-232(%rbp), %rax
	movl	$3, (%rax)
	movq	-216(%rbp), %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-232(%rbp), %rax
	movq	$0, 16(%rax)
	nop
.L27:
	addq	$1, -240(%rbp)
.L25:
	movq	-240(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L36
	movq	-232(%rbp), %rax
.L37:
	movq	-184(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L38
	call	__stack_chk_fail@PLT
.L38:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	push_list, .-push_list
	.globl	pop_list
	.type	pop_list, @function
pop_list:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L40
	movq	stderr(%rip), %rax
	leaq	.LC7(%rip), %rdx
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L41
.L40:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L42
	movq	-24(%rbp), %rax
	jmp	.L41
.L42:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L43
.L44:
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
.L43:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L44
	movq	-16(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
.L41:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	pop_list, .-pop_list
	.globl	elemin_list
	.type	elemin_list, @function
elemin_list:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	movq	%rdi, -248(%rbp)
	movq	%rsi, -256(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L46
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L46:
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	cmpq	$0, -248(%rbp)
	jne	.L47
	movq	stderr(%rip), %rax
	leaq	.LC7(%rip), %rdx
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L71
.L47:
	movl	$16, -208(%rbp)
	movl	$48, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	jmp	.L49
.L70:
	movq	-256(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	cmpl	$115, %eax
	je	.L50
	cmpl	$115, %eax
	jg	.L51
	cmpl	$100, %eax
	je	.L52
	cmpl	$114, %eax
	je	.L53
	jmp	.L51
.L52:
	movl	-208(%rbp), %eax
	cmpl	$47, %eax
	ja	.L54
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L55
.L54:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L55:
	movq	(%rax), %rax
	movq	%rax, -216(%rbp)
	jmp	.L56
.L58:
	movq	-248(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L57
	movq	-248(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, -216(%rbp)
	jne	.L57
	movl	$1, %eax
	jmp	.L71
.L57:
	movq	-248(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -248(%rbp)
.L56:
	cmpq	$0, -248(%rbp)
	jne	.L58
	jmp	.L51
.L53:
	movl	-204(%rbp), %eax
	cmpl	$175, %eax
	ja	.L59
	movq	-192(%rbp), %rax
	movl	-204(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-204(%rbp), %edx
	addl	$16, %edx
	movl	%edx, -204(%rbp)
	jmp	.L60
.L59:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L60:
	movsd	(%rax), %xmm0
	movsd	%xmm0, -224(%rbp)
	jmp	.L61
.L64:
	movq	-248(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$2, %eax
	jne	.L62
	movq	-248(%rbp), %rax
	movsd	8(%rax), %xmm0
	ucomisd	-224(%rbp), %xmm0
	jp	.L62
	ucomisd	-224(%rbp), %xmm0
	jne	.L62
	movl	$1, %eax
	jmp	.L71
.L62:
	movq	-248(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -248(%rbp)
.L61:
	cmpq	$0, -248(%rbp)
	jne	.L64
	jmp	.L51
.L50:
	movl	-208(%rbp), %eax
	cmpl	$47, %eax
	ja	.L65
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L66
.L65:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L66:
	movq	(%rax), %rax
	movq	%rax, -232(%rbp)
	jmp	.L67
.L69:
	movq	-248(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$3, %eax
	jne	.L68
	movq	-248(%rbp), %rax
	movq	8(%rax), %rax
	movq	-232(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L68
	movl	$1, %eax
	jmp	.L71
.L68:
	movq	-248(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -248(%rbp)
.L67:
	cmpq	$0, -248(%rbp)
	jne	.L69
	nop
.L51:
	addq	$1, -256(%rbp)
.L49:
	movq	-256(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L70
	movl	$0, %eax
.L71:
	movq	-184(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L72
	call	__stack_chk_fail@PLT
.L72:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	elemin_list, .-elemin_list
	.section	.rodata
.LC9:
	.string	"[ "
.LC10:
	.string	"%ld "
.LC11:
	.string	"%lf "
.LC12:
	.string	"'%s' "
.LC13:
	.string	"]"
	.text
	.globl	print_list
	.type	print_list, @function
print_list:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L75
.L80:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$3, %eax
	je	.L76
	cmpl	$3, %eax
	ja	.L77
	cmpl	$1, %eax
	je	.L78
	cmpl	$2, %eax
	je	.L79
	jmp	.L77
.L78:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L77
.L79:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %xmm0
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	jmp	.L77
.L76:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
.L77:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
.L75:
	cmpq	$0, -8(%rbp)
	jne	.L80
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	print_list, .-print_list
	.globl	free_list
	.type	free_list, @function
free_list:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	jmp	.L82
.L83:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
.L82:
	cmpq	$0, -24(%rbp)
	jne	.L83
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	free_list, .-free_list
	.section	.rodata
	.align 8
.LC1:
	.long	-858993459
	.long	1073007820
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
