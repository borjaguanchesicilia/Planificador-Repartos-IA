distancia300(D) :- 300 =< D -> (write('\n\n ALERTA: No se puede recorrer más de 300 km. \n\n') , exit) ; true .

exit :- halt.

% distancia300(301). ALERTA: No se puede recorrer más de 300 km.
% distancia300(3).  true
