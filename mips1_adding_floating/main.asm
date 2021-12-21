.data
mantissa_mask: .word 0x7FFFFF
exponent_mask: .word 0x7F800000
hidden_1: .word 0x800000

.text
main:
    lw $t0, exponent_mask
    and $t1, $s0, $t0
    srl $t1, $t1, 0x17
    and $t4, $s1, $t0
    srl $t4, $t4, 0x17
    lw $t0, mantissa_mask
    and $t2, $s0, $t0
    and $t5, $s1, $t0
    lw $t0, hidden_1
    or $t2, $t2, $t0
    or $t5, $t5, $t0
    slt $t6, $t1, $t4
    bne $t6, $0, t4_minus_t1
    sub $t7, $t1, $t4
    add $t0, $0, $t1
    j num2_mant_shift
t4_minus_t1:
    sub $t7, $t4, $t1
    add $t0, $0, $t4
    beq $t7, $0, step5
    beq $t6, $0, num2_mant_shift
    srlv $t2, $t2, $t7
    j step5
num2_mant_shift:
    srlv $t5, $t5, $t7
step5:
    add $t8, $t2, $t5
    addi $t6, $0, 0x2
    srl $t9, $t8, 0x17
    slt $t3, $t9, $t6
    bne $t3, $0, step8
    srl $t8, $t8, 0x1
    addi $t0, $t0, 0x1
step8:
    or $v0, $0, $t0
    sll $v0, $v0, 0x17
    or $v0, $v0, $t8





