.data
    #; Valores de Pitch MIDI aproximados para o riff (E4 a A4)
    #; Middle C (C4) é 60. E4 = 64, F#4 = 66, G4 = 67, A4 = 69
    PITCH_E4: .word 64
    PITCH_FS4: .word 66
    PITCH_G4: .word 67
    PITCH_A4: .word 69
    PITCH_PAUSA: .word 0 #; Pitch 0 ou um delay sem syscall de som para pausa

    #; Sequência de notas (pitches) e durações (em milissegundos)
    #; Riff: E - E E E - F# - G - A (ritmo simplificado)
    notas: .word 64, 64, 64, 66, 67, 69, 0 #; 0 para pausa/fim da sequência neste exemplo
    durações: .word 150, 75, 75, 100, 200, 300, 0 #; Durações em ms

    #; Outros parâmetros MIDI fixos
    INSTRUMENTO: .word 0   #; Instrumento 0 (Piano Acústico)
    VOLUME: .word 100  #; Volume 100 (de 0 a 127)

.text
.globl main

main:
    #; Carrega os endereços base das arrays
    la $t0, notas
    la $t1, durações
    
    #; Carrega instrumento e volume em registradores permanentes
    lw $s0, INSTRUMENTO
    lw $s1, VOLUME

loop_musica:
    #; Carrega a próxima nota e duração
    lw $a0, 0($t0) #; Carrega pitch em $a0
    lw $a1, 0($t1) #; Carrega duração em $a1

    #; Verifica se a nota é 0 (fim da música ou pausa, dependendo da lógica)
    beqz $a0, fim_musica

    #; Configura os registradores para a syscall 33 (MIDI out synchronous)
    #; $a0 já tem o pitch
    #; $a1 já tem a duração
    move $a2, $s0      #; Instrumento em $a2
    move $a3, $s1      #; Volume em $a3
    li $v0, 33         #; Código do serviço 33
    syscall            #; Toca a nota e espera pela duração

    #; Avança para a próxima nota na array (word size = 4 bytes)
    addi $t0, $t0, 4
    addi $t1, $t1, 4

    j loop_musica      #; Repete o loop

fim_musica:
    #; Termina o programa
    li $v0, 10         #; Código do serviço 10 (exit)
    syscall