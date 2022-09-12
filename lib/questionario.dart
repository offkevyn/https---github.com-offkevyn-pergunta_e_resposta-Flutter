import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntasSelecionada;
  final void Function(int) quandoResponder;

  const Questionario({
    Key? key,
    required this.perguntas,
    required this.perguntasSelecionada,
    required this.quandoResponder,
  }) : super(key: key);

  bool get temPerguntaSelecinada {
    return perguntasSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecinada
        ? perguntas[perguntasSelecionada].cast()['respostas']
        : [];

    return Container(
      alignment: Alignment.center,
      child: Container(
        child: Column(
          children: <Widget>[
            Questao(perguntas[perguntasSelecionada]['Texto'].toString()),
            ...respostas.map((resp) {
              return Container(
                width: 300,
                margin: EdgeInsets.only(bottom: 2.5),
                child: Resposta(
                  resp['texto'].toString(),
                  () =>
                      quandoResponder(int.parse(resp['pontuacao'].toString())),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
