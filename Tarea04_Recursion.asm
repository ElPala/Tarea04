.data
.text#inicio del programa
main:
	add $a0,$zero,5 #se añade al registro a0 el numero del exponente
	jal recursion #se manda a llamar a la funcion de recursion
	j exit
recursion:
	addi $sp,$sp,-8 #se guardan 8 espacios de memoria
	sw $ra, 0($sp)#se guarda el retorno de la funcion
	sw $a0, 4($sp) #se guarda el registro a0
	bne $a0 $zero, else#en caso de que a0 sea diferente de 0 se pasa al else
if: #condicion de parada, ocurre cuando a0 es igual a 0
	add $s0, $zero, 1 #se retorna un 1 en el registro s0
	j recursion2 #se manda a llamar la recuperacion de los datos

else:	
	add $a0,$a0,-1 #se decrementa a0
	jal recursion #se manda a llamar denuevo la recursion
	mul $s0,$s0, 2 #se multiplica s0 por 2
	j recursion2 #se manda a llamar la recuperacion de los datos
recursion2:
	lw $ra, 0($sp) #se restablece la direccion de retorno
	lw $a0, 4($sp) #se restablece el valor del registro a0
	addi $sp,$sp,8 #se acomoda el puntero del stack 
	jr $ra #se retorna, de donde fue llamda
exit:#fin del programa