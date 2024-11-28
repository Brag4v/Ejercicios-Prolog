% Definición de las conexiones entre los nodos del laberinto
conexion(origen, n1).
conexion(n1, n2).
conexion(n1, n3).
conexion(n2, n4).
conexion(n2, n5).
conexion(n3, n6).
conexion(n3, n7).
conexion(n4, n8).
conexion(n5, destino).
conexion(n6, n9).
conexion(n7, n10).
conexion(n8, n11).
conexion(n9, n12).
conexion(n10, n13).
conexion(n11, destino).
conexion(n12, n13).

% Relación para determinar si hay un enlace directo o bidireccional
enlace(A, B) :- conexion(A, B).
enlace(A, B) :- conexion(B, A).

% Comprobación de si un nodo ya ha sido visitado en el camino
visitado(Nodo, [Nodo|_]).
visitado(Nodo, [_|Resto]) :- visitado(Nodo, Resto).

% Iniciar la búsqueda desde el origen
resolver :-
    ruta([origen], Solucion),
    write('Camino encontrado: '), write(Solucion).

% Caso base: hemos llegado al destino
ruta([destino|Recorrido], [destino|Recorrido]).

% Caso recursivo: continuar explorando el laberinto
ruta([Actual|Recorrido], Solucion) :-
    enlace(Actual, Siguiente),
    \+ visitado(Siguiente, Recorrido),
    ruta([Siguiente, Actual|Recorrido], Solucion).


