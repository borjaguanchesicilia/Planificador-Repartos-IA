palets30(N) :- 30 =< N -> (write('\n\n ALERTA: No se puede llevar mas de 30 palets. \n\n') , exit) ; true.

exit :- halt.

% palets30(31). ALERTA: No se puede llevar mas de 30 palets.
% palets30(3).  true
