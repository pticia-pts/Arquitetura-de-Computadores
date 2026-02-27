.data

.text

# PATRICIA CRISTINA BANDEIRA DE MELO
# PATRICIA MARIA MACIEL DE PONTES

inicio:
	lui $10, 0x1001
	addi $11, $0, 1 # auxiliar slt
	addi $25, $0, 500 # n maximo

entradaTamanhoDoVetor:
	addi $2, $0, 5
	syscall
	
	slt $8, $25, $2 # se 500 < numero entao digite novamente
	beq $8, $11, digiteNovamente
	
	add $8, $0, $2 # n
	add $9, $0, $8 # i=n
	
	j entradas

digiteNovamente:
	j entradaTamanhoDoVetor

entradas:
	beq $9, $0, resetSoma
	
	addi $2, $0, 5
	syscall
	sw $2, 0($10)
	
	addi $10, $10, 4
	addi $9, $9, -1 
	
	j entradas

resetSoma:
	lui $10, 0x1001
	add $9, $0, 0 # i=0
	add $12, $0, $9 # p=0
	
	lw $13, 0($10) # primeiroElemento
	#lw $14, 4($10)
	add $15, $0, $13 # $15 = soma
	add $16, $0, $15 # $16 = maiorSoma
	addi $17, $0, 1 # contador = 1
	
	addi $9, $9, 1 # i += 1 pra iniciar o laco somando com o segundo elemento
	addi $10, $10, 4
	
	add $19, $0, $8 # limite de parada pro laco i<n

soma:
	beq $9, $19, print
	
	lw $14, 0($10) # v[i]
	add $15, $15, $14 # soma = soma + v[i]
	
	slt $8, $16, $15 # se maiorSoma<soma entao atualiza maiorSoma
	beq $8, $11, atualizaMaiorSoma
	
	add $13, $0, $14 # atualiza primeiroElemento
	add $12, $0, $9 # p = i
	addi $17, $0, 1 # contador = 1
	add $15, $0, $14 # atualiza soma
	
	addi $9, $9, 1 # i++
	addi $10, $10, 4
	
	j soma
	
atualizaMaiorSoma:
	add $16, $0, $15 # maiorSoma = soma
	addi $17, $17, 1 # contador++
	
	add $9, $9, 1 # i++
	addi $10, $10, 4
	
	j soma

print:
	add $4, $0, $16
	addi $2, $0, 1
	syscall
	
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	
	addi $4, $0, 'p'
	addi $2, $0, 11
	syscall
	
	add $4, $0, $12
	addi $2, $0, 1
	syscall
	
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	
	add $4, $0, $17
	addi $2, $0, 1
	syscall

fim:
	addi $2, $0, 10
	syscall
