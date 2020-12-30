% Productos que pueden haber:

sensible(verduras).
sensible(frutas).
fresco(carne).
fresco(pescado).
nocivo(detergentes).
empaquetados(cereales).
agua(agua).


% Sedes de los supermercados (base en polígono de Guímar) 

municipio(candelaria, 5).
municipio(guimar, 2).
municipio(fasnia, 20).
municipio(arico, 30).
municipio(arona, 55).
municipio(arona, 60).
municipio(adeje, 70).
municipio(adeje, 62).
municipio(santaCruz, 18).
municipio(laLaguna, 25).
municipio(puertoCruz, 58).
municipio(puertoCruz, 56).
municipio(orotava, 46).
municipio(realejos, 60).


% Orden de reparto:

reparto([], []).
reparto([H|T], [H|O]) :- reparto(T, O).


% Nº de palets:

num_palets([], 0).
num_palets([_|L], N) :- num_palets(L, N1), N is N1 + 1.


% Tipo de caminon:

cam(N, X, D) :- X is 1 -> ((N > 1 , N =< 10) , (D < 100)).

cam(N, X, D) :- X is 2 -> ((N > 11 , N =< 19) , (D < 150)).

cam(N, X, D) :- X is 3 -> ((N > 20 , N =< 30) ; (D < 250)).


% Busqueda para asegurarnos que el producto del palet existe.

productos([]).
productos([H|T]) :- productos(T), 	
	sensible(H) ; fresco(H) ; nocivo(H) ; empaquetados(H) ; agua(H).

    
% Contar kilometros de ir a cada sede desde la base y volver
sedes([], _, 0).
sedes([M, D|T], _, Q) :-  municipio(M, D),  sedes(T, D, S), Q is (D * 2) + S. 


planificador(I, L, S, O) :-
    	productos(L),
    	sedes(S, _, D),
    	reparto(L, O),
	num_palets(L, N),
    	cam(N, X, D),
    	append([], [X, D, N], I).
