.text
main:
addi $2,$0,5
syscall
add $8,$0,$2

srl $9,$8,31 #descola os bits 31x para a direita e pega o bit mais significativo

beq $9,$0,positivo #compara se int é igual a 0 e vai p positivo
mul $10,$8,$8 #quadrado

j fim 

positivo: add $10,$8,$8 #dobro

fim:
add $4,$0,$10
addi $2,$0,1 
syscall

addi $2,$0,10
syscall