from flask import Flask, request, jsonify
from flask_cors import CORS
import joblib

import json

data = json.load(open('predicciones.json'))


app = Flask(__name__)
CORS(app)

@app.route('/')
def hello_world():
    return '¡Hola, mundo!'

@app.route('/load_model1', methods=['GET'])
def load_model1():
    nota1 = request.args.get('nota1')
    nota2 = request.args.get('nota2')
    nota3 = request.args.get('nota3')
    nota4 = request.args.get('nota4')
    nota5 = request.args.get('nota5')
    nota6 = request.args.get('nota6')
    genero = request.args.get('genero')
    seccion = request.args.get('seccion')
    print("1111")
    model = joblib.load('model1.pkl')
    print(model)
    notaFinal = model.predict([[nota1, nota2, nota3, nota4, nota5, nota6, genero, seccion]])
    print(notaFinal)
    result = {
        'nota': int(notaFinal[0]),
        'prediccion': data["model1"]['prediccion']
    }
    return jsonify(result)

@app.route('/load_Tema1_2_Prom1', methods=['GET'])
def load_Tema1_2_Prom1():
    nota1 = request.args.get('nota1')
    nota2 = request.args.get('nota2')
    genero = request.args.get('genero')
    seccion = request.args.get('seccion')
    print("2222")
    model = joblib.load('Tema1_2_Prom1.pkl')
    print(model)
    Promedio1 = model.predict([[nota1, nota2, genero, seccion]])
    print(Promedio1)
    data = json.load(open('predicciones.json'))
    result = {
        'nota': int(Promedio1[0]),
        'prediccion': data["model2"]['prediccion']
    }
    return jsonify(result)

if __name__ == '__main__':
    app.run()
