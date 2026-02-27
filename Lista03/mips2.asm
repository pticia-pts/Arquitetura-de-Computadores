soma:
    beq $9, $19, print         # se i == n → fim

    lw $14, 0($10)             # v[i]

    # somaNova = soma + v[i]
    add $18, $15, $14          # $18 = somaNova

    # verificar se devemos continuar a soma ou reiniciar
    slt $8, $18, $14           # se somaNova < v[i] → começa nova soma
    beq $8, $11, reiniciaSoma  # se verdade, reinicia

continuaSoma:
    # usa somaNova
    add $15, $0, $18           # soma = somaNova (continua somando)

    # verifica se soma > maior soma
    slt $8, $16, $15
    beq $8, $11, atualizaMaior

avanca:
    addi $9, $9, 1
    addi $10, $10, 4
    j soma


reiniciaSoma:
    add $15, $0, $14           # soma = v[i]
    add $12, $0, $9            # p = i
    addi $17, $0, 1            # contador = 1

    # verifica se essa nova soma é maior soma
    slt $8, $16, $15
    beq $8, $11, atualizaMaior

    j avanca


atualizaMaior:
    add $16, $0, $15           # maiorSoma = soma
    addi $17, $17, 1           # contador++
    j avanca
    
    