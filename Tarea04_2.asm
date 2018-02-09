.data

.text #codigo
addi $s0, $zero,4 #se guarda el valor de 4 en el registor s0, el cual sera el selector
addi $s1,$zero,5 #se guarda el valor de 5 en el registro s1, el cual sera a
addi $s2,$zero, 3 #se guarda el valor de 3 en el registro s2, 3l cual sera b
add $s3,$zero, $zero #se  limpia el valor del registro s3, el cual sera c
addi $t0,$zero,1 #se usara el registro t0 para por hacer la comparacion con el case


case1:
	bne $s0,$t0,case2 #si s0 y t0 hacen match, entnonces el codigo de la siguiente linea se ejecutara.
	jal suma #se manda a llamar la funcion
	j break_ #se sale del switch
case2:
	addi $t0,$t0,1 # se incrementa en 1 t0
	bne $s0,$t0,case3 #si s0 y t0 hacen match, entnonces el codigo de la siguiente linea se ejecutara.
	jal resta #se manda a llamar la funcion
	j break_ #se sale del switch
case3:
	addi $t0,$t0,1 # se incrementa en 1 t0
	bne $s0,$t0,default  #si s0 y t0 hacen match, entnonces el codigo de la siguiente linea se ejecutara, de lo contrario ejecutara la opcion default
	jal multiplica #se manda a llamar la funcion
	j break_ #se sale del switch
default:
	jal andBitwise #se manda a llamar la funcion
	j break_#se sale del switch

break_:
	j exit #fin del programa

suma: #se toma como inputs s1 y s2, los cuales se sumaran para mandarse de resultado en s3
	add $s3,$s1,$s2
	jr $ra

resta: #se toma como inputs s1 y s2, los cuales se restaran para mandarse de resultado en s3
	sub $s3,$s1,$s2
	jr $ra


multiplica: #se toma como inputs s1 y s2, los cuales se multiplicaran para mandarse de resultado en s3
	mul $s3,$s1,$s2
	jr $ra

andBitwise: #se toma como inputs s1 y s2, a los cuales se les aplicara una compuerta logica "and" para mandarse de resultado en s3
	and $s3,$s1,$s2
	jr $ra

exit: #fin del programas
