import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/input_text.dart';
import 'package:http/http.dart' as http;
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'dart:convert';

import 'functions.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();

  final FilteringTextInputFormatter filtroNota = FilteringTextInputFormatter.allow(RegExp(r'^(?:A|B|C|AD)$'));
  final FilteringTextInputFormatter filtroGender = FilteringTextInputFormatter.allow(RegExp(r'^(?:F|M)$'));
  final FilteringTextInputFormatter filtroSection = FilteringTextInputFormatter.allow(RegExp(r'^(?:A|B)$'));

  final List<String> temaList = [
    'Tema 1',
    'Tema 2',
    'Tema 3',
    'Tema 4',
    'Tema 5',
    'Tema 6',
    'Tema 7',
    'Tema 8',
    'Tema 9',
    'Tema 10',
    'Tema 11',
    'Tema 12',
    'Tema 13',
    'Tema 14',
    'Tema 15',
    'Tema 16',
    'Tema 17',
    'Tema 18',
    'Tema 19',
    'Tema 20',
    'Tema 21',
    'Tema 22',
    'Tema 23',
    'Tema 24',
    'Tema 25',
    'Tema 26',
    'Tema 27',
    'Tema 28',
    'Tema 29'
  ];

  String genderStr = 'Género';
  String sectionStr = 'Sección';

  final List<TextEditingController> controllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  final TextEditingController genderController = TextEditingController();
  final TextEditingController sectionController = TextEditingController();

  final List<String> models = [
    'Nofa Final',
    'Promedio 1',
    'Modelo 3',
    'Modelo 4',
    'Modelo 5',
    'Modelo 6',
    'Modelo 7',
    'Modelo 8',
    'Modelo 9',
    'Modelo 10'
  ];

  final List<String> sideTema = [
    'Tema 1',
    'Tema 2',
    'Tema 3',
    'Tema 4',
    'Tema 5',
    'Tema 6',
    'Tema 7',
    'Tema 8',
    'Tema 9',
    'Tema 10',
    'Tema 11',
    'Tema 12',
    'Tema 13',
    'Tema 14',
    'Tema 15',
    'Tema 16',
    'Tema 17',
    'Tema 18',
    'Tema 19',
    'Tema 20',
    'Tema 21',
    'Tema 22',
    'Tema 23',
    'Tema 24',
    'Tema 25',
    'Tema 26',
    'Tema 27',
    'Tema 28',
    'Tema 29'
  ];

  final List<String> sideDescripcion = [
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación',
    'Introducción a la programación'
  ];
}

class _MyAppState extends State<MyApp> {
  String _response = '';
  int _selectedModel = -1;
  List<bool> enabledList = [];
  bool genderEnabled = false;
  bool sectionEnabled = false;

  @override
  void initState() {
    super.initState();
    enabledList = List.generate(widget.temaList.length, (index) => false);
  }

  String validate() {
    switch (_selectedModel) {
      case 0:
        if (widget.genderController.text.isEmpty) {
          return 'Falta género';
        }
        if (widget.sectionController.text.isEmpty) {
          return 'Falta sección';
        }
        if (widget.controllerList[0].text.isEmpty ||
            widget.controllerList[1].text.isEmpty ||
            widget.controllerList[2].text.isEmpty ||
            widget.controllerList[3].text.isEmpty ||
            widget.controllerList[4].text.isEmpty ||
            widget.controllerList[5].text.isEmpty) {
          return 'Faltan notas';
        }
      case 1:
        if (widget.genderController.text.isEmpty) {
          return 'Falta género';
        }
        if (widget.sectionController.text.isEmpty) {
          return 'Falta sección';
        }
        if (widget.controllerList[0].text.isEmpty || widget.controllerList[1].text.isEmpty) {
          return 'Faltan notas';
        }
      case 2:
        if (widget.genderController.text.isEmpty) {
          return 'Falta género';
        }
        if (widget.sectionController.text.isEmpty) {
          return 'Falta sección';
        }
        if (widget.controllerList[0].text.isEmpty ||
            widget.controllerList[1].text.isEmpty ||
            widget.controllerList[2].text.isEmpty ||
            widget.controllerList[3].text.isEmpty ||
            widget.controllerList[4].text.isEmpty ||
            widget.controllerList[5].text.isEmpty ||
            widget.controllerList[6].text.isEmpty ||
            widget.controllerList[7].text.isEmpty ||
            widget.controllerList[8].text.isEmpty ||
            widget.controllerList[9].text.isEmpty ||
            widget.controllerList[10].text.isEmpty ||
            widget.controllerList[11].text.isEmpty ||
            widget.controllerList[12].text.isEmpty) {
          return 'Faltan notas';
        }
    }
    return "";
  }

  void predict(bool readExcel) async {
    if (_selectedModel == -1) {
      setState(() {
        _response = 'Por favor seleccione un modelo';
      });
      return;
    }
    if (!readExcel) {
      String validationResult = validate();
      if (validationResult.isNotEmpty) {
        setState(() {
          _response = validationResult;
        });
        return;
      }
    }
    String response = "";
    if (readExcel) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        var bytes = await file.readAsBytes();
        var excel = Excel.decodeBytes(bytes);
        String sheet = excel.tables.keys.first;
        Sheet? table = excel.tables[sheet];
        if (table != null) {
          int maxCols = table.maxCols;
          if (maxCols == 33) {
            int maxRows = table.maxRows;
            int students = maxRows - 1;
            response = "Se encontraron $students estudiantes.\n";
            for (int i = 1; i < maxRows; i++) {
              String nombre = table.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i)).value.toString();
              String apellido = table.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i)).value.toString();
              response += "$nombre $apellido: ";
              for (int j = 2; j < maxCols; j++) {
                String dataStr = table.cell(CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i)).value.toString();
                if (j == 2) {
                  widget.genderController.text = dataStr == "-" ? "" : dataStr;
                } else if (j == 3) {
                  widget.sectionController.text = dataStr == "-" ? "" : dataStr;
                } else {
                  widget.controllerList[j - 4].text = dataStr == "-" ? "" : dataStr;
                }
              }
              String validationResult = validate();
              if (validationResult.isNotEmpty) {
                response += "$validationResult\n";
              } else {
                String prediction = await fetchPrediction();
                response += prediction;
                response += "\n";
              }
            }
            for (int i = 0; i < 29; i++) {
              widget.controllerList[i].text = '';
            }
            widget.genderController.text = '';
            widget.sectionController.text = '';
          } else {
            response = "La tabla no tiene 31 columnas. Tiene $maxCols columnas.";
          }
        } else {
          response = "No se encontró la hoja de cálculo.";
        }
      } else {
        response = 'No se seleccionó ningún archivo.';
      }
    } else {
      response = await fetchPrediction();
    }
    setState(() {
      _response = response;
    });
  }

  Future<String> fetchPrediction() async {
    String url = 'http://127.0.0.1:5000/';
    String params = '?';
    String headerStr = '';
    switch (_selectedModel) {
      case 0:
        url += 'load_model1';
        params += 'nota1=${stringConvertToNumeber(widget.controllerList[0].text)}';
        params += '&nota2=${stringConvertToNumeber(widget.controllerList[1].text)}';
        params += '&nota3=${stringConvertToNumeber(widget.controllerList[2].text)}';
        params += '&nota4=${stringConvertToNumeber(widget.controllerList[3].text)}';
        params += '&nota5=${stringConvertToNumeber(widget.controllerList[4].text)}';
        params += '&nota6=${stringConvertToNumeber(widget.controllerList[5].text)}';
        params += '&genero=${stringConvertToNumeberGender(widget.genderController.text)}';
        params += '&seccion=${stringConvertToNumeberSeccion(widget.sectionController.text)}';
        headerStr = 'Nota final => ';
        break;

      // TODO: para los demás modelos
      case 1:
        url += 'load_Tema1_2_Prom1';
        params += 'nota1=${stringConvertToNumeber(widget.controllerList[0].text)}';
        params += '&nota2=${stringConvertToNumeber(widget.controllerList[1].text)}';
        params += '&genero=${stringConvertToNumeberGender(widget.genderController.text)}';
        params += '&seccion=${stringConvertToNumeberSeccion(widget.sectionController.text)}';
        headerStr = 'Promedio 1 => ';
        break;
      case 2:
        url += 'load_model2';
        params += 'nota1=${stringConvertToNumeber(widget.controllerList[0].text)}';
        params += '&nota2=${stringConvertToNumeber(widget.controllerList[1].text)}';
        params += '&nota3=${stringConvertToNumeber(widget.controllerList[2].text)}';
        params += '&nota4=${stringConvertToNumeber(widget.controllerList[3].text)}';
        params += '&nota5=${stringConvertToNumeber(widget.controllerList[4].text)}';
        params += '&nota6=${stringConvertToNumeber(widget.controllerList[5].text)}';
        params += '&nota7=${stringConvertToNumeber(widget.controllerList[6].text)}';
        params += '&nota8=${stringConvertToNumeber(widget.controllerList[7].text)}';
        params += '&nota9=${stringConvertToNumeber(widget.controllerList[8].text)}';
        params += '&nota10=${stringConvertToNumeber(widget.controllerList[9].text)}';
        params += '&nota11=${stringConvertToNumeber(widget.controllerList[10].text)}';
        params += '&nota12=${stringConvertToNumeber(widget.controllerList[11].text)}';
        params += '&nota13=${stringConvertToNumeber(widget.controllerList[12].text)}';
        params += '&genero=${stringConvertToNumeberGender(widget.genderController.text)}';
        params += '&seccion=${stringConvertToNumeberSeccion(widget.sectionController.text)}';
        headerStr = 'Nota Final 1 => ';
        break;
      case 3:
      case 4:
      case 5:
      case 6:
      default:
        return 'No definido';
    }
    print("url params: $url$params");
    Uri uri = Uri.parse(url + params);
    var response = await http.get(uri);
    print(response);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return "$headerStr${numberConvertToString(data['nota'])} con una precisión de ${data['prediccion']}";
    } else {
      return 'Error en la solicitud';
    }
  }

  void setModel(int model) {
    for (int i = 0; i < 29; i++) {
      widget.controllerList[i].text = '';
    }
    widget.genderController.text = '';
    widget.sectionController.text = '';
    enabledList = List.generate(29, (index) => false);
    genderEnabled = false;
    sectionEnabled = false;
    switch (model) {
      case 0:
        enabledList[0] = true;
        enabledList[1] = true;
        enabledList[2] = true;
        enabledList[3] = true;
        enabledList[4] = true;
        enabledList[5] = true;
        genderEnabled = true;
        sectionEnabled = true;
        break;
      case 1:
        enabledList[0] = true;
        enabledList[1] = true;
        genderEnabled = true;
        sectionEnabled = true;
        break;
      case 2:
        enabledList[0] = true;
        enabledList[1] = true;
        enabledList[2] = true;
        enabledList[3] = true;
        enabledList[4] = true;
        enabledList[5] = true;
        enabledList[6] = true;
        enabledList[7] = true;
        enabledList[8] = true;
        enabledList[9] = true;
        enabledList[10] = true;
        enabledList[11] = true;
        enabledList[12] = true;
        genderEnabled = true;
        sectionEnabled = true;
        break;
      // TODO: Definir qué campos se habilitan para los demás modelos
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
        enabledList[0] = true;
        genderEnabled = false;
        sectionEnabled = false;
        break;
    }
    _response = '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int width = 150;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PREDECICIÓN DE CALIFICACIONES',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PREDECIR RESULTADOS'),
          leading: Image.asset(
            'assets/images/logo.png',
            width: 40,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Seleccione el modelo a utilizar',
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Builder(builder: (context) {
                        return ElevatedButton(
                          onPressed: () {
                            showModalSideSheet(
                              context: context,
                              width: 1000,
                              body: SizedBox(
                                width: 1000,
                                child: SingleChildScrollView(
                                  child: DataTable(
                                    columns: const [
                                      DataColumn(label: Text('Tema')),
                                      DataColumn(label: Text('Descripción')),
                                    ],
                                    rows: [
                                      for (int i = 0; i < widget.sideTema.length; i++)
                                        DataRow(cells: [
                                          DataCell(Text(widget.sideTema[i])),
                                          DataCell(Text(widget.sideDescripcion[i])),
                                        ]),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: const Text("Ver temas"),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 175,
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Modelo')),
                        DataColumn(label: Text('Descripción')),
                        DataColumn(label: Text('Porcentaje')),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text('Modelo 1')),
                          DataCell(Text('Para la predicción de la nota final de un estudiante, utilza como entradas las notas del 1er Bimestre')),
                          DataCell(Text('61.7% de precisión')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Modelo 2')),
                          DataCell(Text(
                              'Para la predicción de la nota final de un estudiante, utilza como entradas las notas del 1er Bimestre y 2do Bimestre')),
                          DataCell(Text('75% de precisión')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Modelo 3')),
                          DataCell(Text(
                              'Para la predicción de la nota final de un estudiante, utilza como entradas las notas del 1er Bimestre, 2do Bimestre y 3er Bimestre')),
                          DataCell(Text('70.54% de precisión')),
                        ]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InputText(
                      focusNode: FocusNode(),
                      width: width,
                      label: widget.genderStr,
                      controller: widget.genderController,
                      enabled: genderEnabled,
                      inputFormatters: widget.filtroGender,
                      maxLength: 1,
                    ),
                    InputText(
                      width: width,
                      label: widget.sectionStr,
                      controller: widget.sectionController,
                      enabled: sectionEnabled,
                      inputFormatters: widget.filtroSection,
                      maxLength: 1,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    for (int i = 0; i < 10; i++)
                      InputText(
                        width: width,
                        label: widget.temaList[i],
                        controller: widget.controllerList[i],
                        enabled: enabledList[i],
                        inputFormatters: widget.filtroNota,
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    for (int i = 10; i < 20; i++)
                      InputText(
                        width: width,
                        label: widget.temaList[i],
                        controller: widget.controllerList[i],
                        enabled: enabledList[i],
                        inputFormatters: widget.filtroNota,
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    for (int i = 20; i < 29; i++)
                      InputText(
                        width: width,
                        label: widget.temaList[i],
                        controller: widget.controllerList[i],
                        enabled: enabledList[i],
                        inputFormatters: widget.filtroNota,
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < widget.models.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedModel = i;
                                setModel(i);
                              });
                            },
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                color: _selectedModel == i ? Colors.blue : Colors.grey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  widget.models[i],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          predict(false);
                        },
                        child: const Text('Obtener Predicción'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          predict(true);
                        },
                        child: const Text('Cargar excel'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  _response,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
