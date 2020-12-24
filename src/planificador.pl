% Definimos los hechos:

sensible(verduras).
sensible(frutas).
fresco(carne).
fresco(pescado).
nocivo(detergentes).
empaquetados(cereales).
agua(agua).


% Definimos productos no adyacentes:

%not_adjacent(X, Y, [_]) :- X == detergentes,  Y == X.
%not_adjacent(X, Y, [X, Z|_]) :- Z \== Y.
%not_adjacent(X, Y, [Y, Z|_]) :- Z \== X.
%not_adjacent(X, Y, [_|T]) :- not_adjacent(X, Y, T).


% Orden de reparto:

reparto([], []).
reparto([H|T], [H|O]) :- reparto(T, O).


% Nº de palets:

num_palets([], 0).
num_palets([_|L], N) :- num_palets(L, N1), N is N1 + 1.


% Tipo de caminon:

cam(N, X) :- X is 1 -> (N > 1 , N =< 10).

cam(N, X) :- X is 2 -> (N > 11 , N =< 19).

cam(N, X) :- X is 3 -> (N > 20 , N =< 30).


% Busqueda para asegurarnos que el producto del palet existe.

productos([]).
productos([H|T]) :- productos(T), 	
	sensible(H) ; fresco(H) ; nocivo(H) ; empaquetados(H) ; agua(H).
    
    
    
planificador(I, L, O) :-
    
    	productos(L),
    	%(not_adjacent(detergentes, frutas, L) ; member(frutas, L)),
    	%(not_adjacent(detergentes, verduras, L) ; member(verduras, L)),
    	%(not_adjacent(detergentes, carne, L) ; member(carne, L)),
    	%(not_adjacent(detergentes, pescado, L); member(pescado, L)),
	reparto(L, O),
	num_palets(L, N),
    	cam(N, X),
    	append([X], [], Aux),
    	append([N], Aux, I).
