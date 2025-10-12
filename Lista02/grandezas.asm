.text
main:
#lê int
addi $2,$0,5
syscall
add $8,$0,$2
addi $2,$0,5
syscall
add $9,$0,$2

beq $8,$9, igual

#se $8 for menor
slt $10,$8,$9 #Se ($8 < $9) $10 = 1 senao $10 = 0
beq $10,$0, maior8

j maior9

#Se $8 > $9
maior8:
add $4,$0,$8
addi $2,$0,1
syscall

addi $4,$0,'>'
addi $2,$0,11
syscall

add $4,$0,$9
addi $2,$0,1
syscall
j fim

#Se $9 > $8
maior9: 
add $4,$0,$8
addi $2,$0,1
syscall

addi $4,$0,'<'
addi $2,$0,11
syscall

add $4,$0,$9
addi $2,$0,1
syscall
j fim

#Se os valores forem iguais
igual:
add $4,$0,$8 #salva na memória o valor de $8
addi $2,$0,1 #$1 = print int
syscall

addi $4,$0,'=' #salva na memória o =
addi $2,$0,11 #$11 = print Char
syscall

add $4,$0,$9 #salva na memória o valor de $9
addi $2,$0,1 #$1 = print int
syscall
j fim

fim:
addi $2,$0,10
syscall