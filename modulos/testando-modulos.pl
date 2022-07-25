% importa a biblioteca persistency
:- use_module(library(persistency)).
% esquema da rela��o
:- persistent
funcionario(matr�cula:positive_integer,
 nome:atom,
 departamento:nonneg,
 sal�rio:positive_integer,
 matr�cula_gerente:positive_integer).
% Anexa o arquivo que servir� como armaz�m de fatos
:- initialization(db_attach('tbl_funcion�rio.pl', [])).

sincroniza :-
db_sync(gc(always)).
