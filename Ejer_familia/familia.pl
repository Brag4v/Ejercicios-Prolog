padre('roberto', 'lucia').
padre('roberto', 'andres').
padre('camila', 'lucia').
padre('camila', 'andres').
padre('lucia', 'marcos').
padre('daniel', 'marcos').
hijo(X, Y) :- padre(Y, X).
hermano(X, Y) :- padre(A, X), padre(A, Y), X \= Y.
abuelo(X, Y) :- padre(X, Z), padre(Z, Y).
primo(X, Y) :- padre(A, X), padre(B, Y), hermano(A, B).
tio(X, Y) :- padre(Z, Y), hermano(Z, X).
nieto(X, Y) :- abuelo(Y, X).
sobrino(X, Y) :- tio(Y, X).
familia(X, Y) :- padre(X, Y); hijo(X, Y); hermano(X, Y); abuelo(X, Y); primo(X, Y); tio(X, Y); nieto(X, Y); sobrino(X, Y); casado(X, Y); suegro(X, Y).
casado(X, Y) :- padre(X, A), padre(Y, A), X \= Y.
suegro(X, Y) :- padre(X, Z), casado(Z, Y).
suegra(X, Y) :- padre(X, Z), casado(Z, Y).
