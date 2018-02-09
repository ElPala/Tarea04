#include <stdio.h>

int recursion(int x){ //funcion recursiva
   if(x == 0){ //condicion de paro
    return 1; //se retorna un 1
   }else{
     x = recursion(x-1); //se manda a llamar a la funcion pero con un -1
     x = x * 2; //se multiplica por 2
     return x;
   }
}

int main() {
  int x = 5; //numero de veces que se hara la recursion
  int  y = recursion(x); //se manda a llamar la funcion
  printf("%d",y);//se imprime el resultado
  return 0;
}
