not_adjacent(X, Y, [X, Z|T]) :- Z \== Y, member(Y, T).
not_adjacent(X, Y, [Y, Z|T]) :- Z \== X, member(X, T).
not_adjacent(X, Y, [_|T]) :- not_adjacent(X, Y, T).
