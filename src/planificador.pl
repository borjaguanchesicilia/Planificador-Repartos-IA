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

municipio(candelaria, D) :- D is 5 + 0.
municipio(guimar, D) :- D is 2 + 0.
municipio(fasnia, D) :- D is 20 + 0.
municipio(arico, D) :- D is 30 + 0.
municipio(arona, D) :- D is 55 + 0.
municipio(arona, D) :- D is 60 + 0.
municipio(adeje_1, D) :- D is 70 + 0.
municipio(adeje_2, D) :- D is 62 + 0.
municipio(santaCruz, D) :- D is 18 + 0.
municipio(laLaguna, D) :- D is 25 + 0.
municipio(puertoCruz_1, D) :- D is 58 + 0.
municipio(puertoCruz_2, D) :- D is 56 + 0.
municipio(orotava, D) :- D is 46 + 0.
municipio(realejos, D) :- D is 60 + 0.


% Nº de palets:

num_palets([], 0).
num_palets([_|L], N) :- num_palets(L, N1), N is N1 + 1.


% Tipo de caminon:

cam(N, D, X) :- X is 1 -> ((N > 1 , N =< 10) , (D < 100)).

cam(N, D, X) :- X is 2 -> ((N > 11 , N =< 19) , (D < 150)).

cam(N, D, X) :- X is 3 -> ((N > 20 , N =< 30) ; (D < 300)).


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
sedes([], _, 0).
sedes([M|T], _, Q) :-  municipio(M, D), sedes(T, D, S), Q is (D * 2) + S. 


palets30(N) :- 30 =< N -> (write('\n\n ALERTA: No se puede llevar mas de 30 palets. \n\n') , exit) ; true .


distancia300(D) :- 300 =< D -> (write('\n\n ALERTA: No se puede recorrer más de 300 km. \n\n') , exit) ; true .


exit :- halt.


concatena([], Y, Y).
concatena([H|T1], Y, [H|T2]) :- concatena(T1, Y, T2).


adyacente(X, Y, L) :- 	(concatena(_, [X, Y|_], L) ->  false);

			(not(concatena(_, [X, Y|_], L)) -> true).


general(I, L, S, Orden) :- permutation(Orden, L), planificador(I, Orden, S).


planificador(I, L, S) :-
    	productos(L),
    	adyacente(productoNocivo, frutas, L),
    	adyacente(frutas, productoNocivo, L),
    	adyacente(verduras, productoNocivo, L),
    	adyacente(productoNocivo, verduras, L),
    	adyacente(productoNocivo, carnes, L),
    	adyacente(carnes, productoNocivo, L),
    	adyacente(pescados, productoNocivo, L),
    	adyacente(productoNocivo, pescados, L),
    	sedes(S, _, D),
	num_palets(L, N),
	palets30(N),
	distancia300(D),
    	cam(N, D, X),
    	append([], [X, D, N], I),
    	write('\n El tipo de camión es:  '),
    	display(X),
    	write('\n La distancia a recorrer es:  '),
    	display(D),
    	write('\n El número de palets es:  '),
    	display(N).
