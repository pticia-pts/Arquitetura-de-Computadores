.text
main:
#Ler dois números
addi $2,$0,5 #lê inteiro
syscall
add $8,$0,$2 #move valor p/ $8
addi $2,$0,5 #lê outro inteiro
syscall
add $9,$0,$2 #move valor p/ $9

#Maior entre os dois

slt $10,$9,$8 #se ($9<$8) então $10=1 senão $10=0

#comparar
beq $10,$0, maior #se $10 = 0 vai p maior 
add $4,$0,$8
j imprime #pula p/ imprimir

maior:add $4,$0,$9 #imprime o maior

imprime: addi $2,$0,1
syscall

#fim
addi $2,$0,10
syscall