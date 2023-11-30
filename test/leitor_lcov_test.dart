// Importação das bibliotecas necessárias
import 'package:api_testes/leitor_lcov.dart';
import 'package:test/test.dart';

// Função principal para execução dos testes
void main() {
  // Bloco de teste
  test("DEVE PEGAR PORCENTAGEM DE COBERTURA", () {
    // Chamada da função de cobertura
    final result = coverage('./coverage/lcov.info');

    // Assert para verificar se a porcentagem é igual a "100%"
    expect(result, "100%");
  });
}
