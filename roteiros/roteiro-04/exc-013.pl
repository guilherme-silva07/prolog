fat(Num,Res) :-
    fat(Num,1,Res).

fat(0,Res,Res):-!.
fat(Num,Acum,Res) :-
    Acum1 is Acum * Num,
    Num1 is Num - 1,
    fat(Num1,Acum1,Res).
