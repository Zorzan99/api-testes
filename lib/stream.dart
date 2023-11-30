Stream<String> getStreamList() async* {
  yield "Gabriel";
  await Future.delayed(Duration(milliseconds: 500));
  yield "Zorzan";
}


// Stream<String>: Indica que a função retorna um stream de strings.

// async*: Indica que a função é assíncrona e retorna um stream. O uso do * no async* permite que você use a declaração yield para emitir valores para o stream.

// yield "Gabriel";: Emite o valor "Gabriel" para o stream. O yield é usado em funções assíncronas para emitir valores sem concluir a execução da função.

// await Future.delayed(Duration(milliseconds: 500));: Aguarda um atraso de 500 milissegundos (0,5 segundos) de forma assíncrona. Isso adiciona um atraso entre as emissões dos valores no stream.

// yield "Zorzan";: Emite o valor "Zorzan" para o stream após o atraso de 500 milissegundos.

//Essa função cria um stream que emite "Gabriel" imediatamente, aguarda meio segundo e, em seguida, emite "Zorzan".
// Essa abordagem é útil para criar streams que representam eventos assíncronos ou dados que estão disponíveis ao longo do tempo.
// Por exemplo, você pode usar este stream para receber notificações de eventos em intervalos específico