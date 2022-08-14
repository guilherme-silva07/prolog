% Guilherme dos Santos Silva
% 12111bsi214
% Sistema de gest�o de estoque e produ��o da f�brica brasileira de
% aeronaves [2008]

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).

% http_read_data est� aqui
:- use_module(library(http/http_client)).

servidor(Porta) :-
    http_server(http_dispatch, [port(Porta)]).

% Liga a rota ao tratador
:- http_handler(root(.), home ,[]).
:- http_handler(root(cidade), formulario_cidade , []).
:- http_handler(root(bairro), formulario_bairro , []).
:- http_handler(root(logradouro), formulario_logradouro , []).

home(_Pedido) :-
reply_html_page([title('Pagina Principal')],
                  [h1('Pagina Principal'),
                  a([href(cidade)], 'Cidade'),
                  p('') ,
                  a([href(bairro)], 'Bairro'),
                  p(''),
                  a([href(logradouro)], 'Logradouro')]
                ).

formulario_cidade(_Pedido) :-
	reply_html_page(
	    title('Formul�rio Cidade'),
	    [ form([ action='/dadosCidade', method='POST'],
	           [ p([],
	               [ label([for=nome],'Nome:'),
		             input([name=nome, type=textarea]) ]),
		         p([],
		           [ label([for=uf],'UF:'),
		             input([name=uf, type=textarea]) ]),
                         p([],
		           [ label([for=ddd],'DDD:'),
		             input([name=ddd, type=textarea]) ]),
                      button([type=submit],['Enviar'])
	           ])]).

:- http_handler('/dadosCidade', recebe_formulario(Method),
                [ method(Method),
                  methods([post]) ]).

formulario_bairro(_Pedido) :-
	reply_html_page(
	    title('Formul�rio Bairro'),
	    [ form([ action='/dadosBairro', method='POST'],
	           [ p([],
	               [ label([for=nome],'Nome:'),
		             input([name=nome, type=textarea]) ]),
                      button([type=submit],['Enviar'])
	           ])]).

:- http_handler('/dadosBairro', recebe_formulario(Method),
                [ method(Method),
                  methods([post]) ]).

formulario_logradouro(_Pedido) :-
	reply_html_page(
	    title('Formul�rio Logradouro'),
	    [ form([ action='/dadosLogradouro', method='POST'],
	           [ p([],
	               [ label([for=nome],'Nome:'),
		             input([name=nome, type=textarea]) ]),
		         p([],
		           [ label([for=tipo],'Tipo:'),
		             input([name=tipo, type=textarea]) ]),
		         button([type=submit],['Enviar'])
	           ])]).

:- http_handler('/dadosLogradouro', recebe_formulario(Method),
                [ method(Method),
                  methods([post]) ]).

recebe_formulario(post, Pedido) :-
    http_read_data(Pedido, Dados, []),
    format('Content-type: text/html~n~n', []),
    format('<p>', []),
    portray_clause(Dados),
    % escreve os dados do corpo
    format('<p>', []),
    format('<a href="/">Voltar para a pagina principal</a>').
