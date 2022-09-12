import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'Texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 1},
        {'texto': 'Branco', 'pontuacao': 1}
      ],
    },
    {
      'Texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 1},
        {'texto': 'Leão', 'pontuacao': 1}
      ],
    },
    {
      'Texto': 'Qual seu favorito?',
      'respostas': [
        {'texto': 'Rafael', 'pontuacao': 10},
        {'texto': 'Prof de Linuxxxxx', 'pontuacao': 5},
        {'texto': 'Prof de Matematica', 'pontuacao': 1},
        {'texto': 'Prof de Meio Ambiente', 'pontuacao': 1}
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('PERGUNTAS')),
            titleTextStyle: TextStyle(
                color: Color(0xFFe574bc),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            backgroundColor: Color(0xFF96d7ff),
          ),
          body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF96d7ff),
                Color(0xFFc4c7ff),
                Color(0xFFdabfff),
                Color(0xFFeabaf6),
              ],
            )),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 500.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 180, 237),
                border: Border.all(
                    width: 2.0, color: Color.fromARGB(255, 229, 116, 188)),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade600,
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: const Offset(10, 10))
                ],
              ),
              child: temPerguntaSelecionada
                  ? Questionario(
                      perguntas: _perguntas,
                      perguntasSelecionada: _perguntaSelecionada,
                      quandoResponder: _responder,
                    )
                  : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
            ),
          )),
    );
  }
}
