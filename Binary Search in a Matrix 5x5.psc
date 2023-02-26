//Esta función se encargará de hacer la busqueda binaria en la matriz 5x5 y te dirá la ubicación del elemento ->
//que se desea buscar. Si hay más de un elemento, solo te dirá la primera ubicación de dicho elemento. ->
//Si no hay el elemento te dirá que no se ha encontrado el elemento.
SubProceso busqueda (matriz, num)
	Definir a, b, m, n, r, l, izquierda, derecha, medio, ultimo Como Entero;
	Definir encontrar, intervalo Como Logico;
	encontrar<- falso;
	intervalo<- falso;
	ultimo<- 0;
	
	a<- 0;
	b<- 0;
	
	m<- 4;
	n<- 4;
	
	//Estas variables son como los extremos del intervalo que se irá redución debido a la búsqueda binaria.
	izquierda<- matriz[a, b];
	derecha<- matriz[m, n];
	
	//Estas variables tomarán aproximadamente las posiciones del punto medio del intervalo. ->
	//Si el resultado es 2,5. Al truncar el número. La variable tomará el valor entero 2.
	r<- trunc((a+m)/2);
	l<- trunc((b+n)/2);
	
	//Punto medio del intervalo.
	medio<- matriz[r, l];
	
	//Cada vez que se va repitiendo el ciclo el intervalo se va reduciendo.
	Repetir
		Si num=medio Entonces
			Escribir "";
			Escribir "El elemento se encuentra en la posición [", r, ", ", l, "] de la matriz.";
			encontrar<- verdadero;
			
		SiNo
			Si num>medio Entonces  //Si cumple eliminamos la mitad del intervalo que es menor al número que ->
				//estamos buscando.
				a<- r;
				b<- l;
				
				izquierda<- matriz[a, b];
				
				r<- trunc((a+m)/2);
				l<- trunc((b+n)/2);
				
				medio<- matriz[r, l];
				
			SiNo
				si num<medio Entonces  //Si cumple eliminamos la mitad del intervalo que es mayor al número que ->
					//estamos buscando.
					m<- r;
					n<- l;
					
					derecha<- matriz[m, n];
					
					r<- trunc((a+m)/2);
					l<- trunc((b+n)/2);
					
					medio<- matriz[r, l];
					
					
				FinSi
				//NOTA.- He notado que cuando quero buscar un elemento que se encuentra dentro de la primera mitad ->
				//de la matriz, la variable izquierda y medio llegan a estar en el mismo elemento. Y si quiero buscar ->
				//un elemento que se encuentra dentro de la segunda mitad de la matriz, la varable derecha y medio ->
				//llegan a estar en el mismo elemento. Entonces, este patrón podría servir como una señal para ->
				//empezar con el análisis del intervalo pequeño.
				
			FinSi
		FinSi
		
		
		//El intervalo inicial estaba conformado por todos los elementos de la matriz. El objetivo es reducir ->
		//dicho intervalo y lo hacemos a través de la busqueda binaria. Pero, cuando el intervalo que posiblemente ->
		//contenga al número, es lo suficientemente pequeño. Que en mi caso he decidido cuando la variable izquierda ->
		//que es la que contiene el valor inicial del intervalo, se encuentra solamente a una fila de distancia de la ->
		//variable derecha, la cual contiene el valor final del intervalo. Pues, que se ponga a analizar uno por uno ->
		//en dicho intervalo pequeño. A ver si se encuentra o no el número que estoy buscando.
		Si a+1=m Entonces 
			Repetir
				//Es como la parte 2, de una condición que la puse al final.
				si a=m Y b=n Entonces
					ultimo<- 1;
				FinSi
				
				//Ahora izquierda el la variable que va a analizar elemento por elemento, a ver si se encuentra ->
				//el número que estoy buscando.
				si izquierda=num Entonces
					Escribir "";
					Escribir "El elemento se encuentra en la posición [", a, ", ", b, "] de la matriz.";
					encontrar<- verdadero;
					intervalo<- verdadero;
					
				SiNo //Aquí pongo las instrucciones para que se mueva ordenadamente por los elementos del intervalo.
					si b<4 Entonces
						b<- b + 1;
						
					SiNo //Significa que b ya es igual a 4.
						si a<4 Entonces
							a<- a + 1;
							b<- 0;
							
						SiNo //Significa que a también ya es igual a 4.
							a<- 4;
							b<- 4;
						FinSi
						
						
					FinSi
					izquierda<- matriz[a, b];
				FinSi
				
				
				//Primera parte de la condición.
				//Esta condición es si termina de analizar todos los elementos del intervalo pequeño y no encontró ->
				//nada. Pues, que lo imprima en pantalla.
				si ultimo=1 Y intervalo=falso Entonces
					Escribir "";
					Escribir "El elemento no se encuentra en la matriz.";
					encontrar<- verdadero;
					intervalo<- verdadero;
				FinSi
				
				
			Hasta Que intervalo=Verdadero
			
			
		FinSi
 		
	Hasta Que encontrar=Verdadero 
	

FinSubProceso








Proceso Metodo_de_busqueda_binaria_en_una_matriz_5x5
	Definir i, j, matriz como entero;
	Dimension matriz[5, 5];
	
	
	
	//Creación de la matriz.
	Para i<-0 Hasta 4 Hacer
		Para j<-0 Hasta 4 Hacer
			matriz[i, j]<- azar(500);
		FinPara
	FinPara
	
	
	//Impresión de la matriz.
	Escribir "Matriz 5x5 creada con valores aleatoreos: ";
	Escribir "";
	Para i<-0 Hasta 4 Hacer
		Para j<-0 Hasta 4 Hacer
			si j<4 Entonces
				Escribir matriz[i, j], ", "; sin saltar
				
			SiNo
				Escribir matriz[i, j];
			FinSi
		FinPara
	FinPara
	
	
	//Ordenamiento de la matriz con el método de burbuja mejorado.
	Definir aux Como Entero;
	Definir ordenado Como Logico;
	
	
	Repetir 
		ordenado<- Verdadero; //Tanto i cono j tienen que demostrarme que no esta ordenado. 
		Para i<-0 Hasta 4 Hacer
			Para j<-0 Hasta 3 Hacer
				si matriz[i, j] > matriz[i, j+1] Entonces
					aux<- matriz[i, j];
					matriz[i, j]<- matriz[i, j+1];
					matriz[i, j+1]<- aux;
					ordenado<- falso;
				FinSi
			FinPara
			
			Si i>0 Entonces
				Si matriz[i-1, 4] > matriz[i, 0] Entonces
					aux<- matriz[i-1, 4];
					matriz[i-1, 4]<- matriz[i, 0];
					matriz[i, 0]<- aux;
					ordenado<- falso;
				FinSi
			FinSi
		FinPara
		
		
	Hasta Que ordenado=Verdadero
	
	
	
	//Impresión de la matriz ordenada.
	Escribir "";
	Escribir "";
	Escribir "Matriz 5x5 ya ordenada: ";
	Escribir "";
	Para i<-0 Hasta 4 Hacer
		Para j<-0 Hasta 4 Hacer
			si j<4 Entonces
				Escribir matriz[i, j], ", "; sin saltar
				
			SiNo
				Escribir matriz[i, j];
			FinSi
		FinPara
	FinPara
	
	
	//Pedir número.
	Definir num Como Entero;
	Escribir "";
	Escribir "Ingrese el número que desea buscar en la matriz:";
	Leer num;
	
	//Llamando a la función que no devuelve valor.
	busqueda(matriz, num);
	
	
	
FinProceso
