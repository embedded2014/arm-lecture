	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, r6, r7, lr}
	
	mov  r4, r0  @counter
	mov  r5, #0
	sub  r5, r5, #1   @previous
	mov  r6, #0
	add  r6, r6, #1   @result
.L1:	
	sub r4, r4, #1
	add r7, r5, r6   @r7 = sum = previous + result
	mov r5, r6
	mov r6, r7
	cmp r4 ,#-2
		bgt .L1
        mov r0, r5
	pop {r3, r4, r5, r6, r7, pc}		@EPILOG

	@ END CODE MODIFICATION


	.size fibonacci, .-fibonacci
	.end
