num_palets([], 0).
num_palets([_|T], N) :- num_palets(T, Acc), N is Acc + 1.
