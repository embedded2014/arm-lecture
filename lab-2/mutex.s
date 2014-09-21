	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
	ldr r2,=locked  //load value of locked and save to r2

luck_loop:
	//When No.(x-1) thread enter,it will modify flag of r1 for tell No.x "I'm working."
	//r1 is locked-flag in the program
	ldrex r1,[r0]  //As point, That's enter address of r0 to load it and save to r1.
	cmp r1,#locked
	beq luck_loop //if No.(x-1) still work, return to wait.
	strex r1,r2,[r0] //Save the state from [r0] to r2 is success?
	cmp r1,#success
	bne luck_loop
        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex
	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
        ldr r1, =unlocked
	str r1,[r0]
        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex
	.end
