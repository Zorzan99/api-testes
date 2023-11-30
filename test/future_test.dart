// Importação das bibliotecas necessárias
import 'package:api_testes/future.dart';
import 'package:test/test.dart';

// Função principal para execução dos testes
void main() {
  // Bloco de teste
  test("Deve completar a requisição trazendo uma lista de nomes", () {
    // Chamada da função que retorna um Future contendo uma lista de nomes
    final future = getFutureList();

    // Assert para verificar se o Future é completado com sucesso e traz a lista esperada
    expect(future, completion(equals(["Gabriel", "Zorzan"])));
  });
}
