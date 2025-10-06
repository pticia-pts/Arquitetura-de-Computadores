.text
main:  

addi $2,$0, 5 # 5 lê um número inteiro
syscall # solicita um número inteiro
add $8, $0, $2 # cópia do valor do $2 para o $8
add $9,$8,$8 #soma do valor por ele mesmo
add $4,$0,$9 # $4 = imprime valor. Coloca na memória para imprimir
addi $2,$0,1 # o 1 printa o valor
syscall
addi $2,$0,10 #o 10 encerra o programa
syscall