vogal(a).
vogal(e).
vogal(i).
vogal(o).
vogal(u).

consoante(b).
consoante(c).
consoante(d).
consoante(f).
consoante(g).
consoante(r).
consoante(j).
consoante(k).
consoante(l).
consoante(m).
consoante(n).
consoante(p).
consoante(q).
consoante(r).
consoante(s).
consoante(t).
consoante(v).
consoante(w).
consoante(x).
consoante(y).
consoante(z).
concatena(X, Bs):- string_concat("p", X, Bs).
transforma(Xs, Bs):- string_chars(Xs, Bs).

frases([],[]).
frases([X|Xs],[A|B]) :- palavra(X,A), frases(Xs,B).


palavra([],[]).
palavra([X|Xs],[C|D]) :- silaba(X,C), palavra(Xs,D).

silaba(X, Rs) :- transforma(X, [C | Cs]), consoante(C), transforma(Ss, Cs), concatena(Ss, Qs), string_concat(X, Qs, Fs), atom_string(Rs, Fs).
silaba(X, Rs)  :- transforma(X, [C | _Cs]), vogal(C), concatena(X, Qs), string_concat(X, Qs, Fs), atom_string(Rs,Fs).

frasesP([],[]).
frasesP([X|Xs],[A|B]) :- palavraP(X,A), frasesP(Xs,B).

palavraP([],[]).
palavraP([X|Xs],[C|D]) :- silabaP(X,C), palavraP(Xs,D).

silabaP(X, []) :- transforma(X, [C | Cs]), C==p.

silabaP(X, [C|Rs]) :- transforma(X, [C | Cs]), transforma(Cs,Ss), silabaP(Ss,Rs).
