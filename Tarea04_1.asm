.data #variables
k: .word 3 #variable k
Vector1: .word 1 2 3 #vector 1
Vector2: .word 6 7 8 #vector 2
Result: .word 0 0 0 0 0 0 0 0 0# arreglo de los resultados, nunca es usado.
.text #codigo
main: #main
lw $t0 , k #se lee el dato de k y se as al registro t0
add $t1,$zero,$zero #se limpia el registo t1
la $t2,Vector1 #se asigna la direccion de memoria a t2
la $t3,Vector2 #se asigna la direccion de memoria a t3
for: #inicio del ciclo for
	beq $t0,$t1, exit #si t0 y t1 son inguales el programa habra acabado, todo esto en funcion de k
	addi $t1, $t1,1	#se incrementa el conteo de t1
	lw $a0,0($t2) #se len los datos, segum la direccion de memoria que contenga t2, el cual accede al vector 1
	lw $a1,0($t3)#se len los datos, segum la direccion de memoria que contenga t3, el cual accede al vector 2
	addi $t2, $t2,4 #se incrementa en 4 la direccion de memoria
	addi $t3, $t3,4 #se incrementa en 4 la direccion de memoria
	jal multAndAccumulate #se manda a llamar la funcion
	add $t4,$t4,$s0 #se añade el resultado de s0
	j for #continua el for


multAndAccumulate:
	addi $sp,$sp,-16 #se guarda 16 espacios de memoria
	sw $ra, 0($sp) #se guardan los registros que se usan en la funcion.
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	mul $a0,$a0,$a1 #se multiplica los registros
	add $a1,$zero,$a2 #se le asigna un nuevo valor al registro
	jal Acumulate #se manda a llamar la funcion
	lw $ra, 0($sp) #se restauran los valores de los registros usados.
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addi $sp,$sp,16
	jr $ra #se retorna al main
Acumulate:
	add $s0, $zero,$zero #se limpia el registro
	add $s0,$a0,$a1 #se suman los inputs a0 y a1
	jr $ra
exit: #fin del programa




