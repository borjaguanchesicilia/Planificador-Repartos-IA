comprobarAdyacente(X, X).
comprobarAdyacente(X, [_|T]) :- comprobarAdyacente(X, T).

adyacente(P1, P2, Productos) :- (comprobarAdyacente([P1, P2|_], Productos) ->  false);

				 (not(comprobarAdyacente([P1, P2|_], Productos)) -> true).
			
			
% adyacente(productoNocivo, frutas, [frutas, verduras, cereales, productoNocivo]). true
% adyacente(productoNocivo, frutas, [productoNocivo, frutas, verduras, cereales]). false
