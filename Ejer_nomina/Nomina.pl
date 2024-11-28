% Declarar los predicados dinámicos
:- dynamic empleado/3.

% Datos iniciales
empleado(ana_martinez, junior, 2000000).
empleado(luis_fernandez, intermedio, 3500000).
empleado(carla_gonzalez, senior, 6000000).

% Reglas de deducciones
descuento_salud(Sueldo, Descuento) :-
    Descuento is Sueldo * 0.03.

descuento_pension(Sueldo, Descuento) :-
    Descuento is Sueldo * 0.04.

% Reglas de bonificaciones
bono(junior, Sueldo, Bonificacion) :-
    Bonificacion is Sueldo * 0.04.
bono(intermedio, Sueldo, Bonificacion) :-
    Bonificacion is Sueldo * 0.08.
bono(senior, Sueldo, Bonificacion) :-
    Bonificacion is Sueldo * 0.12.

% Cálculo del salario final
salario_final(Nombre, SalarioFinal) :-
    empleado(Nombre, Nivel, SueldoBase),
    descuento_salud(SueldoBase, DescSalud),
    descuento_pension(SueldoBase, DescPension),
    bono(Nivel, SueldoBase, Bonificacion),
    SalarioFinal is SueldoBase - DescSalud - DescPension + Bonificacion.
