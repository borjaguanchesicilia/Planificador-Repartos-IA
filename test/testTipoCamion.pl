cam(N, D, X) :- X is 1 -> ((N > 1 , N =< 10) , (D < 100)).

cam(N, D, X) :- X is 2 -> ((N > 11 , N =< 19) , (D < 150)).

cam(N, D, X) :- X is 3 -> ((N > 20 , N =< 30) ; (D < 300)).

% cam(5, 50, X). X = 1, 2, 3
% cam(15, 50, X). X = 2, 3
% cam(25, 50, X). X = 3
