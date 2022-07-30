% Guilherme dos Santos Silva
% 12111BSI214
% Sistema de Gest�o de Estoque e Produ��o da F�brica  Brasileira de Aeronaves [2008]
% P�ginas 91, 92 e 93

:- module(cep,[cep/4]).
:- use_module(library(persistency)).
:- use_module(chave,[]).

:- persistent
    cep(
        cep_id: positive_integer,
        cid_id: positive_integer,
        bai_id: positive_integer,
        log_id: positive_integer).

:- initialization(db_attach('tbl_cep.pl', [])).
:- initialization(at_halt(db_sync(gc(always)))).

insere(Id,CidadeId,BairroId,LogradouroId):-
    chave:pk(cep,Id),
    with_mutex(cep,
               assert_cep(Id,CidadeId,BairroId,LogradouroId)).

remove(Id):-
    with_mutex(cep,
               (   retractall_cep(Id,_CidadeId,_BairroId,_LogradouroId))).

atualiza(Id,CidadeId,BairroId,LogradouroId):-
    with_mutex(cep,
               (   retract_cep(Id,_CidadeId,_BairroId,_LogradouroId),
                   assert_cep(Id,CidadeId,BairroId,LogradouroId))).

