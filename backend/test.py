import json

data = json.load(open('predicciones.json'))

print(data["model1"]['prediccion'])