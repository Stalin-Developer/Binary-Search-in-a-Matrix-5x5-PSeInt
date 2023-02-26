//Esta funci�n se encargar� de hacer la busqueda binaria en la matriz 5x5 y te dir� la ubicaci�n del elemento ->
//que se desea buscar. Si hay m�s de un elemento, solo te dir� la primera ubicaci�n de dicho elemento. ->
//Si no hay el elemento te dir� que no se ha encontrado el elemento.
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
	
	//Estas variables son como los extremos del intervalo que se ir� reduci�n debido a la b�squeda binaria.
	izquierda<- matriz[a, b];
	derecha<- matriz[m, n];
	
	//Estas variables tomar�n aproximadamente las posiciones del punto medio del intervalo. ->
	//Si el resultado es 2,5. Al truncar el n�mero. La variable tomar� el valor entero 2.
	r<- trunc((a+m)/2);
	l<- trunc((b+n)/2);
	
	//Punto medio del intervalo.
	medio<- matriz[r, l];
	
	//Cada vez que se va repitiendo el ciclo el intervalo se va reduciendo.
	Repetir
		Si num=medio Entonces
			Escribir "";
			Escribir "El elemento se encuentra en la posici�n [", r, ", ", l, "] de la matriz.";
			encontrar<- verdadero;
			
		SiNo
			Si num>medio Entonces  //Si cumple eliminamos la mitad del intervalo que es menor al n�mero que ->
				//estamos buscando.
				a<- r;
				b<- l;
				
				izquierda<- matriz[a, b];
				
				r<- trunc((a+m)/2);
				l<- trunc((b+n)/2);
				
				medio<- matriz[r, l];
				
			SiNo
				si num<medio Entonces  //Si cumple eliminamos la mitad del intervalo que es mayor al n�mero que ->
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
				//llegan a estar en el mismo elemento. Entonces, este patr�n podr�a servir como una se�al para ->
				//empezar con el an�lisis del intervalo peque�o.
				
			FinSi
		FinSi
		
		
		//El intervalo inicial estaba conformado por todos los elementos de la matriz. El objetivo es reducir ->
		//dicho intervalo y lo hacemos a trav�s de la busqueda binaria. Pero, cuando el intervalo que posiblemente ->
		//contenga al n�mero, es lo suficientemente peque�o. Que en mi caso he decidido cuando la variable izquierda ->
		//que es la que contiene el valor inicial del intervalo, se encuentra solamente a una fila de distancia de la ->
		//variable derecha, la cual contiene el valor final del intervalo. Pues, que se ponga a analizar uno por uno ->
		//en dicho intervalo peque�o. A ver si se encuentra o no el n�mero que estoy buscando.
		Si a+1=m Entonces 
			Repetir
				//Es como la parte 2, de una condici�n que la puse al final.
				si a=m Y b=n Entonces
					ultimo<- 1;
				FinSi
				
				//Ahora izquierda el la variable que va a analizar elemento por elemento, a ver si se encuentra ->
				//el n�mero que estoy buscando.
				si izquierda=num Entonces
					Escribir "";
					Escribir "El elemento se encuentra en la posici�n [", a, ", ", b, "] de la matriz.";
					encontrar<- verdadero;
					intervalo<- verdadero;
					
				SiNo //Aqu� pongo las instrucciones para que se mueva ordenadamente por los elementos del intervalo.
					si b<4 Entonces
						b<- b + 1;
						
					SiNo //Significa que b ya es igual a 4.
						si a<4 Entonces
							a<- a + 1;
							b<- 0;
							
						SiNo //Significa que a tambi�n ya es igual a 4.
							a<- 4;
							b<- 4;
						FinSi
						
						
					FinSi
					izquierda<- matriz[a, b];
				FinSi
				
				
				//Primera parte de la condici�n.
				//Esta condici�n es si termina de analizar todos los elementos del intervalo peque�o y no encontr� ->
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
	
	
	
	//Creaci�n de la matriz.
	Para i<-0 Hasta 4 Hacer
		Para j<-0 Hasta 4 Hacer
			matriz[i, j]<- azar(500);
		FinPara
	FinPara
	
	
	//Impresi�n de la matriz.
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
	
	
	//Ordenamiento de la matriz con el m�todo de burbuja mejorado.
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
	
	
	
	//Impresi�n de la matriz ordenada.
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
	
	
	//Pedir n�mero.
	Definir num Como Entero;
	Escribir "";
	Escribir "Ingrese el n�mero que desea buscar en la matriz:";
	Leer num;
	
	//Llamando a la funci�n que no devuelve valor.
	busqueda(matriz, num);
	
	
	
FinProceso
