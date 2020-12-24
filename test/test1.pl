sensible(verduras).
sensible(frutas).
fresco(carne).
fresco(pescado).
nocivo(detergentes).
empaquetados(cereales).
agua(agua).

productos([]).
productos([H|T]) :- (sensible(H) ; fresco(H) ; nocivo(H) ; empaquetados(H) ; agua(H)), productos(T).
