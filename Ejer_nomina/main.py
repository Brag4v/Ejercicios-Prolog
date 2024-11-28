from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from pyswip import Prolog

# Inicializar la aplicación de FastAPI y cargar el archivo Prolog
app = FastAPI()
prolog_engine = Prolog()
prolog_engine.consult("empleados.pl")

# Modelo de solicitud para registrar un empleado
class EmpleadoEntrada(BaseModel):
    nombre: str
    nivel: str
    sueldo_base: float

# Endpoint para registrar un nuevo empleado
@app.post("/registrar_empleado/")
def registrar_empleado(empleado: EmpleadoEntrada):
    nombre = empleado.nombre.lower()
    nivel = empleado.nivel.lower()
    sueldo_base = empleado.sueldo_base

    if nivel not in ["junior", "intermedio", "senior"]:
        raise HTTPException(status_code=400, detail="Nivel no válido. Debe ser 'junior', 'intermedio' o 'senior'.")

    try:
        # Verificar si el empleado ya está registrado
        consulta = f"empleado({nombre}, _, _)"
        if list(prolog_engine.query(consulta)):
            raise HTTPException(status_code=400, detail="El empleado ya está registrado.")
        
        # Registrar el nuevo empleado en la base de datos Prolog
        comando = f"assertz(empleado({nombre}, {nivel}, {sueldo_base}))"
        list(prolog_engine.query(comando))
        return {"mensaje": f"Empleado {nombre} registrado exitosamente."}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

# Modelo de solicitud para calcular el salario
class ConsultaEmpleado(BaseModel):
    nombre: str

# Endpoint para calcular el salario final
@app.post("/calcular_salario/")
def calcular_salario(empleado: ConsultaEmpleado):
    nombre = empleado.nombre.lower()

    try:
        # Consultar en Prolog el salario final
        query = f"salario_final({nombre}, SalarioFinal)"
        resultado = list(prolog_engine.query(query))
        if resultado:
            salario_final = resultado[0]["SalarioFinal"]
            return {"nombre": nombre, "salario_final": salario_final}
        else:
            raise HTTPException(status_code=404, detail="Empleado no encontrado.")
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

# Ejecutar la aplicación
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)
