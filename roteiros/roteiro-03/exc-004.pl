intercala([],X,X).
intercala(X,[],X).
intercala([Cab|Cauda],[Head|Tail],[Cab,Head|X]) :- intercala(Cauda,Tail,X).
