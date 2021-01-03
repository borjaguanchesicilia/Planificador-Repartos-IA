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

sedes([], 0).
sedes([M|T], Q) :-  municipio(M, D), sedes(T, S), Q is (D * 2) + S. 


% sedes([candelaria, guimar, fasnia], D). D = 54
