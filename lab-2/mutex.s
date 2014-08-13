	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
	@ INSERT CODE BELOW
	ldr r1, =locked
.L1:
	ldrex r2, [r0]
	cmp r2, #0
	bne .L2
	strex r2, r1, [r0]
	cmp r2, #0
	beq .L1
	dmb
	bx lr
.L2:
	wfe
	b .L1
	@ END CODE INSERT

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
	ldr r1, =unlocked
	dmb
	str r1, [r0]
	dsb
	sev
	@ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
