.text
main:

# número
addi $2,$0,5
syscall
add $8,$0,$2 # qtd linhas

add $9,$0,1 #numero
add $10,$0,1 #linhas
add $11,$0,1 #colunas

linha:
slt $12,$8,$11 #se ($8 < $10) $12 = 1, $12 = 0
bne $12,$0,fim

coluna:
slt $12,$11,$10 
bne $12,$0,quebra_linha

#imprimir

add $4,$0,$9
addi $2,$0,1
syscall
addi $4,$0, ' '
addi $2,$0,11
syscall

addi $9,$9,1
addi $10,$10,1
j coluna

quebra_linha:
addi $4,$0,10
addi $2,$0,11
syscall
addi $11,$11,1
addi $10,$0,1

j linha

fim: addi $2,$0,10
syscall 


