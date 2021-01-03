concatena([], Y, Y).
concatena([H|T1], Y, [H|T2]) :- concatena(T1, Y, T2).

adyacente(X, Y, L) :- 	(concatena(_, [X, Y|_], L) -> false);

			(not(concatena(_, [X, Y|_], L)) -> true).
			
			
% adyacente(productoNocivo, frutas, [frutas, verduras, cereales, productoNocivo]). true
% adyacente(productoNocivo, frutas, [productoNocivo, frutas, verduras, cereales]). false
