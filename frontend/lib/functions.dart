String stringConvertToNumeber(String input) {
  switch (input) {
    case 'A':
      return '3';
    case 'B':
      return '2';
    case 'C':
      return '1';
    case 'AD':
      return '4';
  }
  return '';
}

String numberConvertToString(int input) {
  switch (input) {
    case 3:
      return 'A';
    case 2:
      return 'B';
    case 1:
      return 'C';
    case 4:
      return 'AD';
  }
  return '';
}

String stringConvertToNumeberGender(String input) {
  switch (input) {
    case 'F':
      return '0';
    case 'M':
      return '1';
  }
  return '';
}

String stringConvertToNumeberSeccion(String input) {
  switch (input) {
    case 'A':
      return '0';
    case 'B':
      return '1';
  }
  return '';
}
