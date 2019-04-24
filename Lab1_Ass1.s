.data
addrInt1:	.word 99	# 99 -> addrInt1
addrSum:	.word 0		# 0 -> addrSum

	.global _start
	.text
START:
	movia r2, addrInt1	# Int1* -> r2
	ldw r3, (r2)		# Int1 -> r3
	movi r4, 100		# 100 -> r4

CHECK:	
	bgtu r3, r4, END	# If Int1>100 => END
	
SUM_CALC:
	mov r5, r0		# initialization X:=0
	mov r6, r0		# initialization S:=0
LOOP:	
	bgeu r5, r3, STORE_SUM	# if x>=Int1 => STORE_SUM
	add r6, r6, r5		# S:=S+X
	addi r5, r5, 1		# X:=X+1
	br LOOP			# continue LOOP
	
STORE_SUM:
	movia r7, addrSum	# addrSum* -> r7
	stw r6, (r7)		# Sum -> (addrSum)
	
END:
	
	
endloop:
	br endloop # that's it
.end