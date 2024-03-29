por_extenso(X,[�tomo,X]) :-
    atom(X),!.

por_extenso(X,[numero,inteiro,X]) :-
    integer(X),!.

por_extenso(X,[numero,flutuante,X]) :-
    float(X),!.

por_extenso(X,[vari�vel,X]) :-
    var(X),!.

por_extenso([],[]).
por_extenso([H|T],[lista,com,cabe�a,H,e,cauda,�,uma|Cauda]):-
    nonvar(H),
    por_extenso(T,Cauda).

por_extenso(X,[termo,composto,com,funtor,Funtor,e,com,aridade,Aridade]):-
    functor(X,Funtor,Aridade),!.
