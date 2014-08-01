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
	push {r3, r4, r5, lr}

	@ R4 = R0 - 0 (update flags)
	@ if(R0 <= 0) goto .L3 (which returns 0)
        subs r4, r0, #0
        ble .L3

	@ Compare R4 wtih 1
	@ If R4 == 1 goto .L4 (which returns 1)
        cmp r4, #1
        beq .L4

	@ R0 = R4 - 1
	@ Recursive call to fibonacci with R4 - 1 as parameter
        subs r0, r4, #1
        bl fibonacci

	@ R5 = R0
	@ R0 = R4 - 2
	@ Recursive call to fibonacci with R4 - 2 as parameter
        mov r5, r0
        subs r0, r4, #2
        bl fibonacci

	@ R0 = R5 + R0 (update flags)
        adds r0, r5, r0

	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
