import 'dart:io';
import 'dart:math';


void main() {

  // Types of the parameters:
  // Posicionais Obrigatórios
  // Nomeados Opcionais
  // Parameters "Standard"
  // Modificador "required"


  String fruta = "Laranja";
  double peso = 100.2;
  String colorFruit  = "Green or orange";
  String flavor = "Sweet or sour";
  bool isMadura;
  print("Digite a quantidade de dias da fruta: ");
  String input = stdin.readLineSync()!;
  int dias = int.parse(input);
  String qualidade = verificarQualidade(dias);


  //String, double, int, char or bool - type of the attribute or variable
  // stdin.readLineSync()! - Command to input
  // int,double.parse - Command to convert the variable



  print("A fruta está madura? "+ verificarQualidade(dias));
}

String verificarQualidade(int dias) {
  if (dias >= 30) {
    return "Está madura";
  } else {
    return "Não está madura";
  }
}