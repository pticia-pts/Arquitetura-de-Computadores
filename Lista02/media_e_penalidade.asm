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

#$8 = n1
#$9 = n2
#$10 = faltas

media:
mul $11,$8,2
mul $12,$9,3
addi $13,$0,5
add $14,$11,$12
div $14,$13
mflo $15

penalidades:
div $10,$13
mflo $16
addi $17,$0,10
mul $18,$16,$17

MediaFinal:
sub $19,$15,$18

print:
add $4,$0,$15
addi $2,$0,1
syscall

add $4,$0,$18
addi $2,$0,1
syscall

add $4,$0,$19
addi $2,$0,1
syscall

fim:
addi $2,$0,10
syscall

