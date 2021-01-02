%Productos que pueden haber:

sensible(verduras).
sensible(frutas).
fresco(carne).
fresco(pescado).
nocivo(detergentes).
empaquetados(cereales).
agua(agua).


% Sedes de los supermercados (base en polígono de Guímar) 

municipio(candelaria, D) :- D is 5 + 0.
municipio(guimar, D) :- D is 2 + 0.
municipio(fasnia, D) :- D is 20 + 0.
municipio(arico, D) :- D is 30 + 0.
municipio(arona, D) :- D is 55 + 0.
municipio(arona, D) :- D is 60 + 0.
municipio(adeje, D) :- D is 70 + 0.
municipio(adeje, D) :- D is 62 + 0.
municipio(santaCruz, D) :- D is 18 + 0.
municipio(laLaguna, D) :- D is 25 + 0.
municipio(puertoCruz, D) :- D is 58 + 0.
municipio(puertoCruz, D) :- D is 56 + 0.
municipio(orotava, D) :- D is 46 + 0.
municipio(realejos, D) :- D is 60 + 0.


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
sedes([M|T], _, Q) :-  municipio(M, D),  sedes(T, D, S), Q is (D * 2) + S. 


planificador(I, L, S, O) :-
    	productos(L),
    	sedes(S, _, D),
    	reparto(L, O),
	num_palets(L, N),
    	cam(N, X, D),
    	append([], [X, D, N], I).
