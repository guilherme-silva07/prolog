impar(Num) :-
    X is Num mod 2,
    X \= 0.

fatdup(Num,Res) :-
    fatdup(Num,1,Res).

fatdup(0,Res,Res) :- !.
fatdup(Num,Acum,Res) :-
    impar(Num),
    Acum1 is Acum * Num,
    Num1 is Num - 1,
    fatdup(Num1,Acum1,Res).
fatdup(Num,Acum,Res):-
    not(impar(Num)),
    Num1 is Num - 1,
    fatdup(Num1,Acum,Res).
