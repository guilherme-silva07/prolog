s(Conta,Conta1) --> as(Conta), bs(Conta1), cs(Conta1), ds(Conta).
as(0) --> [].
as(NovoCnt) --> [a], as(Cnt), {NovoCnt is Cnt + 1}.
bs(0) --> [].
bs(NovoCnt) --> [b], bs(Cnt), {NovoCnt is Cnt + 1}.
cs(0) --> [].
cs(NovoCnt) --> [c], cs(Cnt), {NovoCnt is Cnt + 1}.
ds(0) --> [].
ds(NovoCnt) --> [d], cs(Cnt), {NovoCnt is Cnt + 1}.
