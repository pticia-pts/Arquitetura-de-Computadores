.text
main:
#lê primeiro int
addi $2,$0,5
syscall
add $8,$0,$2

#lê segundo int
addi $2,$0,5
syscall
add $9,$0,$2

slt $10,$8,$9 #se ($8 < $9) então $10=1 senão $10=0

beq $10,$0, maior

add $4,$0,$9
#diferença
sub $12,$9,$8

j fim

maior: add $4,$0,$8
sub $12,$8,$9
#fim
fim: 
addi $2,$0,1
syscall

addi $4,$0, '\n'
addi $2,$0,11
syscall
add $4, $12, $0
addi $2, $0, 1
syscall

#encerra
addi $2,$0, 10
syscall
