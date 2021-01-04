%Productos que pueden haber:

sensible(X) :- X == frutas; X == verduras.

fresco(X) :- X == carnes; X == pescados.

nocivo(productoNocivo).

empaquetados(X) :- Empaquetados = [cereales, panMolde, pastas, enlatados, encurtidos],
                   member(X, Empaquetados).

frio(X) :- Frio = [lacteos, congelados, chacinas],
                   member(X, Frio).
                   
agua(agua).


% Sedes de los supermercados (base en polígono de Guímar) 

municipio(candelaria, Distancia) :- Distancia is 5 + 0.
municipio(guimar, Distancia) :- Distancia is 2 + 0.
municipio(fasnia, Distancia) :- Distancia is 20 + 0.
municipio(arico, Distancia) :- Distancia is 30 + 0.
municipio(arona_1, Distancia) :- Distancia is 55 + 0.
municipio(arona_2, Distancia) :- Distancia is 60 + 0.
municipio(adeje_1, Distancia) :- Distancia is 70 + 0.
municipio(adeje_2, Distancia) :- Distancia is 62 + 0.
municipio(santaCruz, Distancia) :- Distancia is 18 + 0.
municipio(laLaguna, Distancia) :- Distancia is 25 + 0.
municipio(puertoCruz_1, Distancia) :- Distancia is 58 + 0.
municipio(puertoCruz_2, Distancia) :- Distancia is 56 + 0.
municipio(orotava, Distancia) :- Distancia is 46 + 0.
municipio(realejos, Distancia) :- Distancia is 60 + 0.


% Nº de palets:

num_palets([], 0).
num_palets([_|L], Palets) :- num_palets(L, N), Palets is N + 1.


% Tipo de caminon:

cam(Palets, Distancia, X) :- X is 1 -> ((Palets > 1 , Palets =< 10) , (Distancia < 100)).

cam(Palets, Distancia, X) :- X is 2 -> ((Palets > 11 , Palets =< 19) , (Distancia < 150)).

cam(Palets, Distancia, X) :- X is 3 -> ((Palets > 20 , Palets =< 30) ; (Distancia < 300)).


% Busqueda para asegurarnos que el producto del palet existe.

productos([]).
productos([H|T]) :- (sensible(H); 
                    fresco(H); 
                    nocivo(H); 
                    empaquetados(H);
                    frio(H);
                    agua(H)),
                    productos(T).
	
	  
% Contar kilometros de ir a cada sede desde la base y volver
sedes([], 0).
sedes([SedeMunicipio|T], F) :-  municipio(SedeMunicipio, Distancia), sedes(T, S), F is (Distancia * 2) + S. 


palets30(Palets) :- 30 =< Palets -> (write('\n\n ALERTA: No se puede llevar mas de 30 palets. \n\n') , exit) ; true .


distancia300(Distancia) :- 300 =< Distancia -> (write('\n\n ALERTA: No se puede recorrer más de 300 km. \n\n') , exit) ; true .


exit :- halt.


comprobarAdyacente(X, X).
comprobarAdyacente(X, [_|T]) :- comprobarAdyacente(X, T).


adyacente(P1, P2, Productos) :- (comprobarAdyacente([P1, P2|_], Productos) ->  false);

				 (not(comprobarAdyacente([P1, P2|_], Productos)) -> true).


general(Info, Productos, Sedes, Orden) :- productos(Productos),
                                          permutation(Orden, Productos), 
                                          planificador(Info, Orden, Sedes).


planificador(Info, Productos, Sedes) :-
    	adyacente(productoNocivo, frutas, Productos),
    	adyacente(frutas, productoNocivo, Productos),
    	adyacente(verduras, productoNocivo, Productos),
    	adyacente(productoNocivo, verduras, Productos),
    	adyacente(productoNocivo, carnes, Productos),
    	adyacente(carnes, productoNocivo, Productos),
    	adyacente(pescados, productoNocivo, Productos),
    	adyacente(productoNocivo, pescados, Productos),
    	sedes(Sedes, Distancia),
	num_palets(Productos, Palets),
	palets30(Palets),
	distancia300(Distancia),
    	cam(Palets, Distancia, Camion),
    	append([], [Camion, Distancia, Palets], Info),
    	write('\n El tipo de camión es:  '),
    	display(Camion),
    	write('\n La distancia a recorrer es:  '),
    	display(Distancia),
    	write('\n El número de palets es:  '),
    	display(Palets).
