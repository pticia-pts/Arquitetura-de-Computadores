.text
main:
addi $8,$0,0 #i=0

addi $2,$0,5
syscall
add $9,$0,$2 # $9 = n 

while: beq $9,$8,saida
	
	add $4,$0,$8
	addi $2,$0,1
	syscall
	
	addi $4,$0,' '
	addi $2,$0,11
	syscall
	addi $8,$8,1
	j while
	
saida:
addi $2,$0,10
syscall
