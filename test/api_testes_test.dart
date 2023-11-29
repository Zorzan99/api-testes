import 'package:api_testes/api_testes.dart';

import 'package:test/test.dart';

// Função principal do programa de testes
void main() {
  // Teste para verificar se a função calcIMC retorna o resultado esperado
  test("Deve efetuar o cálculo do IMC", () {
    // Chamando a função calcIMC com valores específicos
    final result = calcIMC(1.73, 64);

    // Verificando se o resultado obtido é igual ao valor esperado
    expect(result, equals(21.383941996057334));
  });

  // Teste para verificar se a função lança uma exceção se a altura for menor que 1
  test("Deve lançar uma exceção se a altura for menor que 1", () {
    // Usando a função 'expect' para verificar se a função lança uma exceção do tipo 'Exception'
    expect(() => calcIMC(0, 64), throwsA(isA<Exception>()));
  });

  // Teste para verificar se a função lança uma exceção se o peso for menor que 1
  test("Deve lançar uma exceção se o peso for menor que 1", () {
    // Usando a função 'expect' para verificar se a função lança uma exceção do tipo 'Exception'
    expect(() => calcIMC(1.73, 0), throwsA(isA<Exception>()));
  });
}

// test("Deve efetuar o cálculo do IMC", () { ... });: Testa se a função calcIMC retorna o resultado esperado para determinados valores de entrada.

// test("Deve lançar uma exceção se a altura for menor que 1", () { ... });: Testa se a função calcIMC lança uma exceção quando a altura é menor que 1.

// test("Deve lançar uma exceção se o peso for menor que 1", () { ... });: Testa se a função calcIMC lança uma exceção quando o peso é menor que 1.

// expect(result, equals(21.383941996057334));: Compara o resultado retornado pela função calcIMC com o valor esperado usando a função expect do pacote test.

// expect(() => calcIMC(0, 64), throwsA(isA<Exception>()));: Verifica se a chamada da função calcIMC com altura zero e peso 64 lança uma exceção do tipo Exception.

// expect(() => calcIMC(1.73, 0), throwsA(isA<Exception>()));: Verifica se a chamada da função calcIMC com altura 1.73 e peso zero lança uma exceção do tipo Exception.