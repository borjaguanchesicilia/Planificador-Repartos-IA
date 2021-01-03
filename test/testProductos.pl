sensible(X) :- X == frutas; X == verduras.

fresco(X) :- X == carnes; X == pescados.

nocivo(productoNocivo).

empaquetados(X) :- Empaquetados = [cereales, panMolde, pastas, enlatados, encurtidos],
                   member(X, Empaquetados).

frio(X) :- Frio = [lacteos, congelados, chacinas],
                   member(X, Frio).
                   
agua(agua).


productos([]).
productos([H|T]) :- (sensible(H); 
                    fresco(H); 
                    nocivo(H); 
                    empaquetados(H);
                    frio(H);
                    agua(H)),
                    productos(T).	
