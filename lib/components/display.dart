import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculadora/models/memory.dart';
import 'package:flutter/material.dart';

/// Componente que mostra o valor atual da calculadora
class Display extends StatelessWidget {
  final Memory memory;

  // Construtor que recebe a memória como parâmetro
  Display(this.memory);

  @override
  Widget build(BuildContext context) {
    // Retorna um widget que expande para preencher a área disponível
    return Expanded(
      flex: 1,
      child: Container(
        // Cor de fundo usada no visor.
        color: Color.fromARGB(255, 33, 33, 33),
        child: Column(
          // Coloca o texto na parte inferior do visor
          mainAxisAlignment: MainAxisAlignment.end,
          // Faz o texto ocupar toda a largura
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (memory.buffer != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: AutoSizeText(
                  memory.buffer!,

                  minFontSize: 15,
                  maxFontSize: 30,
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none,
                    color: Colors.grey,
                    fontSize: 30,
                  ),
                ),
              ),
            Padding(
              // Espaçamento interno ao redor do texto.
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                memory.value,// Texto que vem da memória e mostra o valor atual
                
                // Permite redimensionar a fonte para caber quando o número for longo
                minFontSize: 20,
                maxFontSize: 80,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: TextStyle(
                  // peso do texto.
                  fontWeight: FontWeight.w100,
                  // retira decoração extra no texto
                  decoration: TextDecoration.none,
                  // tamanho base da fonte
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}