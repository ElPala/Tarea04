.data
.text #inicio de programa
main:

addi $s0,$zero, 1 #se añade 1 al registro s0, el cual sera counter
add $s1,$zero,$zero #se le asigna 0 a s1, el cual sera variable
addi $t0,$zero,20 #se le añande 20 a t0, el cual rea el tope de condicion
while:
	add $a0, $zero, $s0 #se cargan los inputs
	add $a1, $zero, $s0
	jal suma #se manda a llamar la funcion
	div $s1,$s0,4 #se divide el resultado de la funcion entre 4 y se le asigna al registro s1
	slt $t1,$s1,$t0 #se checa si s1 < t0
	bne $t1,$zero,while#en caso de que la condicion anterionr sea cierta t1 sera 1
	j exit #salta al fin del progrma

suma:#funcion suma, la cual agarra como paramentro dos registros: a0, a1, para luego regresar la suma de estos en el registro s0
	add $s0, $zero,$zero #se limpia la variable
	add $s0,$a0,$a1 #se acutualiza el registro
	jr $ra #se retorna al main
exit: #fin del programa
