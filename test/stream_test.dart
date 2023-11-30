// Importação das bibliotecas necessárias
import 'package:api_testes/stream.dart';
import 'package:test/test.dart';

// Função principal para execução dos testes
void main() {
  // Bloco de teste
  test("Deve completar a requisição trazendo uma lista de nomes", () {
    // Chamada da função que retorna um Stream contendo uma lista de nomes
    final stream = getStreamList();

    // Assert para verificar se o Stream emite os valores na ordem esperada
    expect(stream, emitsInOrder(["Gabriel", "Zorzan"]));
  });
}
