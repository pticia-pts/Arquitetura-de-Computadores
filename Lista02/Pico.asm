.text
main:

addi $2, $0, 5
syscall
add $8, $0, $2 
addi $2, $0, 5
syscall
add $9, $0, $2 
addi $2, $0, 5
syscall
add $10, $0, $2 

# $8 = a
# $9 = b
# $10 = c

#pico positivo ( a<b e b>c)
slt $11,$8,$9 
slt $12,$10,$9

and $13,$11,$12
bne $13,$0,positivo

#pico negativo (a>b e b<c)
slt $14,$9,$8
slt $15,$10,$9

and $16,$14,$15
bne $16,$0, negativo

add $2,$0,11
addi $4,$0,'N'
Syscall

j fim

positivo:
addi $4,$0,'P'
addi $2,$0,11
Syscall

addi $4,$0,'+'
addi $2,$0,11
Syscall

j fim

negativo:
addi $4,$0,'P'
addi $2,$0,11
Syscall

addi $4,$0,'-'
addi $2,$0,11
Syscall

fim: addi $2,$0, 10
Syscall
