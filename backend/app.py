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

# Modelo 1
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
    model = joblib.load('model1.pkl')
    print(model)
    notaFinal = model.predict([[nota1, nota2, nota3, nota4, nota5, nota6, genero, seccion]])
    print(notaFinal)
    result = {
        'nota': int(notaFinal[0]),
        'prediccion': data["model1"]['prediccion']
    }
    print("Hola")
    print(result)
    
    return jsonify(result)

# Modelo 2
@app.route('/load_model2', methods=['GET'])
def load_model2():
    nota6 = request.args.get('nota6')
    nota7 = request.args.get('nota7')
    nota8 = request.args.get('nota8')
    nota9 = request.args.get('nota9')
    nota10 = request.args.get('nota10')
    nota13 = request.args.get('nota13')
    genero = request.args.get('genero')
    seccion = request.args.get('seccion')
    # print("2222")
    model = joblib.load('model2.pkl')
    print(model)
    NotaFinal = model.predict([[nota6, nota7, nota8, nota9, nota10, nota13, genero, seccion]])
    
    data = json.load(open('predicciones.json'))
    result = {
        'nota': int(NotaFinal[0]),
        'prediccion': data["model2"]['prediccion']
    }
    return jsonify(result)


# Modelo 3
@app.route('/load_model3', methods=['GET'])
def load_model3():
    nota6 = request.args.get('nota6')
    nota7 = request.args.get('nota7')
    nota8 = request.args.get('nota8')
    nota9 = request.args.get('nota9')
    nota10 = request.args.get('nota10')
    nota11 = request.args.get('nota11')
    nota12 = request.args.get('nota12')
    nota13 = request.args.get('nota13')
    nota14 = request.args.get('nota14')
    nota15 = request.args.get('nota15')
    nota16 = request.args.get('nota16')
    nota17 = request.args.get('nota17')
    nota18 = request.args.get('nota18')
    nota19 = request.args.get('nota19')
    nota20 = request.args.get('nota20')
    nota21 = request.args.get('nota21')
    
    # print("2222")
    model = joblib.load('Model3.pkl')
    print(model)
    NotaFinal = model.predict([[nota6, nota7, nota8, nota9, nota10, nota11, nota12, nota13, nota14, nota15, nota16, nota17, nota18, nota19, nota20, nota21]])
    print(NotaFinal)
    data = json.load(open('predicciones.json'))
    result = {
        'nota': int(NotaFinal[0]),
        'prediccion': data["model3"]['prediccion']
    }
    return jsonify(result)

# Modelo 4
@app.route('/load_model4', methods=['GET'])
def load_model4():
    nota1 = request.args.get('nota1')
    nota2 = request.args.get('nota2')
    genero = request.args.get('genero')
    seccion = request.args.get('seccion')
    print("2222")
    model = joblib.load('model4.pkl')
    print(model)
    Promedio1 = model.predict([[nota1, nota2, genero, seccion]])
    print(Promedio1)
    data = json.load(open('predicciones.json'))
    result = {
        'nota': int(Promedio1[0]),
        'prediccion': data["model4"]['prediccion']
    }
    return jsonify(result)

# Modelo 5
@app.route('/load_model5', methods=['GET'])
def load_model5():
    nota7 = request.args.get('nota7')
    nota8 = request.args.get('nota8')
    nota9 = request.args.get('nota9')
    genero = request.args.get('genero')
    seccion = request.args.get('seccion')
    print("2222")
    model = joblib.load('model5.pkl')
    print(model)
    Promedio2 = model.predict([[nota7, nota8, nota9, genero, seccion]])
    print(Promedio2)
    data = json.load(open('predicciones.json'))
    result = {
        'nota': int(Promedio2[0]),
        'prediccion': data["model5"]['prediccion']
    }
    return jsonify(result)

# Modelo 6
@app.route('/load_model6', methods=['GET'])
def load_model6():
    nota13 = request.args.get('nota13')
    nota14 = request.args.get('nota14')
    nota15 = request.args.get('nota15')
    nota16 = request.args.get('nota16')
    genero = request.args.get('genero')
    seccion = request.args.get('seccion')
    print("2222")
    model = joblib.load('model6.pkl')
    print(model)
    Promedio3 = model.predict([[nota13, nota14, nota15, nota16, genero, seccion]])
    print(Promedio3)
    data = json.load(open('predicciones.json'))
    result = {
        'nota': int(Promedio3[0]),
        'prediccion': data["model6"]['prediccion']
    }
    return jsonify(result)

# Modelo 7
@app.route('/load_model7', methods=['GET'])
def load_model7():
    nota22 = request.args.get('nota22')
    nota23 = request.args.get('nota23')
    nota24 = request.args.get('nota24')
    nota25 = request.args.get('nota25')
    genero = request.args.get('genero')
    seccion = request.args.get('seccion')
    print("2222")
    model = joblib.load('model7.pkl')
    print(model)
    Promedio4 = model.predict([[nota22, nota23, nota24, nota25, genero, seccion]])
    print(Promedio4)
    data = json.load(open('predicciones.json'))
    result = {
        'nota': int(Promedio4[0]),
        'prediccion': data["model7"]['prediccion']
    }
    return jsonify(result)


# Modelo 8

# Modelo 9

# Modelo 10


if __name__ == '__main__':
    app.run()
