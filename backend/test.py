import json

data = json.load(open('predicciones.json'))

print(data["model1"]['prediccion'])



"""
Modelo1 max-depth = 5
random_state = 0
train_size = 0.75


Modelo2 max-depth = 4
random_state = 0
train_size = 0.75
porcentaje= 0.7405, accuracy = 0.7553
Entradas: Tema6, tema7, tema8, tema9, tema10, tema13, Salida: Nota Final


Modelo3 max-depth = 4
random_state = 42
train_size = 0.75
0.6595744680851063
0.6480337578484455
Entradas Tema6, tema7, tema8, tema9, tema10, tema11, tema12, tema13, tema14, tema15, ... tema21, Salida: Nota Final
No incluye genero ni sección


Modelo4 max-depth = 5
random_state = 42
train_size = 0.75
0.7553191489361702
0.7808510638297873
Entradas nota1 y nota2, salida nota: promedio 1er bimestre


Modelo5 max-depth = 3
random_state = 42
train_size = 0.75
0.7311827956989247
0.7386151482925677
Entradas nota7, nota8, nota9, salida: nota promedio 2do bimestre


Modelo6 max-depth = 6
random_state = 42
train_size = 0.75
0.7634408602150538
0.7638840713762669
Entradas nota 13, nota14, nota15 y nota16 , salida: nota promedio 3er bimestre


Modelo7 max-depth = 4
random_state = 42
train_size = 0.75
0.7419354838709677
0.7730803758453528
Entradas nota22, nota23 y nota24, nota25, salida: nota promedio 4to bimestre


Modelo8 max-depth = 
random_state = 
train_size = 0.75

Modelo9 max-depth = 
random_state = 
train_size = 0.75

Modelo10 max-depth = 
random_state = 
train_size = 0.75


"""