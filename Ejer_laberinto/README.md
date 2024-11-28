# Laberinto en Prolog

Este proyecto es una implementación de un laberinto en **Prolog**, donde se busca un camino desde un nodo de inicio hasta un nodo de destino a través de conexiones predefinidas entre los nodos, el objetivo del programa es determinar si existe un camino que conecte el punto de inicio con el destino.

# Descripción

Este código Prolog simula un laberinto en el que las conexiones entre los nodos se representan mediante hechos y reglas. Se utiliza un algoritmo de búsqueda recursiva para encontrar un camino desde el nodo `origen` hasta el nodo `destino`.

# Características:
- Definición de conexiones entre nodos.
- Búsqueda de un camino entre el nodo de inicio y el destino.
- Uso de recursión para explorar las conexiones entre los nodos.
- Evita ciclos y nodos repetidos en el camino.

# Estructura del Código

- **conexion/2**: Define las conexiones entre los nodos.
- **enlace/2**: Relación bidireccional que asegura que los nodos están conectados en ambas direcciones.
- **visitado/2**: Verifica si un nodo ya ha sido visitado durante la búsqueda para evitar ciclos.
- **resolver/0**: Inicia el proceso de búsqueda e imprime el camino encontrado.
- **ruta/2**: Regla recursiva que busca un camino entre nodos.

# Integrante
Brayan Stiven Galindo Suesca - 20212020133
