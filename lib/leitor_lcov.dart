import 'dart:io'; // Importa a biblioteca para interação com o sistema de arquivos.
import 'package:api_testes/line_report.dart'; // Importa a classe LineReport de um arquivo externo.

void main() {
  // Função principal
  final result = coverage(
      './coverage/lcov.info'); // Chama a função coverage com o caminho do arquivo LCOV.
  print(result); // Imprime o resultado.
}

// Função para calcular a porcentagem de cobertura.
String coverage(String lcovPath) {
  final file =
      File(lcovPath); // Cria um objeto de arquivo com o caminho fornecido.
  final content = file
      .readAsLinesSync(); // Lê o conteúdo do arquivo e o converte em uma lista de linhas.
  final reports = contentToLineReport(
      content); // Converte o conteúdo do arquivo em objetos LineReport.

  final percent =
      calculatePercent(reports); // Calcula a porcentagem total de cobertura.

  return '${percent.toString()}%'; // Retorna a porcentagem formatada como uma string.
}

// Função para calcular a porcentagem total de cobertura.
int calculatePercent(List<LineReport> reports) {
  int totalLF = 0; // Inicializa o total de linhas encontradas.
  int totalLH = 0; // Inicializa o total de linhas atingidas.

  // Loop sobre os relatórios de linha para calcular os totais.
  for (var report in reports) {
    totalLF += report.lineFonud; // Adiciona as linhas encontradas ao total.
    totalLH += report.lineHit; // Adiciona as linhas atingidas ao total.
  }

  final percent = (totalLH / totalLF) * 100; // Calcula a porcentagem.
  return percent.round(); // Retorna a porcentagem arredondada.
}

// Função para converter o conteúdo do arquivo em objetos LineReport.
List<LineReport> contentToLineReport(List<String> content) {
  final reports = <LineReport>[]; // Inicializa uma lista de objetos LineReport.

  var sf = ''; // Inicializa o nome do arquivo-fonte.
  var lf = 0; // Inicializa o número de linhas encontradas.
  var lh = 0; // Inicializa o número de linhas atingidas.

  // Loop sobre as linhas do conteúdo do arquivo.
  for (var text in content) {
    if (text == "end_of_record") {
      // Quando encontrar "end_of_record", cria um objeto LineReport e o adiciona à lista.
      final report = LineReport(
        sourceFile: sf,
        lineFonud: lf,
        lineHit: lh,
      );

      reports.add(report);
      continue;
    }

    // Divide a linha para obter o tipo e o valor.
    final line = text.split(":");

    // Verifica o tipo da linha e atualiza as variáveis apropriadas.
    if (line[0] == "SF") {
      sf = line[1];
    } else if (line[0] == "LF") {
      lf = int.parse(line[1]);
    } else if (line[0] == "LH") {
      lh = int.parse(line[1]);
    }
  }

  return reports; // Retorna a lista de objetos LineReport.
}
