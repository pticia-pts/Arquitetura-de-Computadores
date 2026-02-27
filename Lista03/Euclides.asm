.text
main:

addi $2,$0,5
syscall
add $8,$0,$2

addi $2,$0,5
syscall
add $9,$0,$2

while: beq $9,$0,fim

div $8,$9
mfhi $10 # $10 = RESTO

# a=b
add $8,$0,$9
# R=B
add $9,$0,$10

j while

fim:
add $4,$0,$8
addi $2,$0,1
syscall
addi $2,$0,10
syscall


